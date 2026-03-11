#!/bin/bash
NOTEBOOK_ID="1e690da4-333b-41b6-8537-00d75b7d6489"
INFOGRAPHIC_ID="0ca61364-577e-49e6-8b98-1af9b8fdf14f"
VIDEO_ID="09795157-70f8-41ab-83b5-1a21e2efc2f0"

while true; do
  echo "=== Checking status at $(date +%H:%M:%S) ==="
  nlm studio status "$NOTEBOOK_ID"
  
  # Check if both are complete
  STATUS=$(nlm studio status "$NOTEBOOK_ID" 2>/dev/null)
  if echo "$STATUS" | grep -q '"status": "completed"' && ! echo "$STATUS" | grep -q "in_progress"; then
    echo "✓ All artifacts complete!"
    echo "Downloading infographic..."
    nlm download infographic "$NOTEBOOK_ID" --id "$INFGRAPHIC_ID" --output assets/infographics/github_ready_notebooklm.png
    echo "Downloading video..."
    nlm download video "$NOTEBOOK_ID" --id "$VIDEO_ID" --output assets/videos/github_ready_explainer_notebooklm.mp4
    break
  fi
  
  echo "Waiting 60 seconds..."
  sleep 60
done
