auto_user_prompt = \
'''You are an intelligent agent tasked with autonomously shopping online to find and purchase a product that matches a set of requirements.

Action Space:

1. Search: Initiate or refine a search using keywords.
2. Back to Search: Return to the search results page.
3. Prev/Next Page: Navigate between pages of search results.
4. Click[Product Title]: Select a product from the list by its title.
5. Click[Option]: Choose a specific product option (e.g., size, color, quantity).
6. Desc/Overview: Open and review the detailed description or overview of a product.
7. Previous: Return to the previously viewed page.
8. Buy: Proceed to purchase the selected product.

Task Guidelines:
- Goal Specification: Find and purchase a product that meets the following criteria:
  - [Insert product requirements, e.g., "A laptop under $800 with at least 16GB RAM and SSD storage."]
- Constraints: Minimize the time taken to find the best match and avoid unnecessary navigation.
- Environment Details: You will interact with a web-based e-commerce platform. Search terms should be relevant and concise.

Example Workflow:
1. Search for the product using keywords derived from the criteria.
2. Evaluate search results using Click[Product Title] and Desc/Overview to review detailed information.
3. Use Click[Option] to specify the desired configuration of the product.
4. Navigate efficiently with Prev/Next Page, Previous, or Back to Search to refine your exploration.
5. Finalize the process with Buy when a product meeting all criteria is found.

Following above instruction, given a user query, please make a plan as a web agent.

User Query: {Q}
'''

qa_user_prompt = \
'''I will provide a question. Your task is to generate an answer based on your own knowledge.

Question: {Q}'''