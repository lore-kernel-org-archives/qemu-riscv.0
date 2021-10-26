Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGB9-0003Bo-NJ
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAw-00034i-5f; Tue, 26 Oct 2021 02:43:12 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAr-0008LU-0S; Tue, 26 Oct 2021 02:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230584; x=1666766584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LZY9aIog688ACRn9v1sFVo0EZJ0feFHY9C5xQBrGttQ=;
 b=lApmzs7oj4xfl1EjHdROth9JLYNqHhUfVkmKJcyZdR3Jo38y8Yss07n/
 iVmmzqr6rtKERIqeQ8CiMfFq64gfTnCmUJrHLEPEBuoPKVY01MendWlEt
 Z5Nk+tAkan9vfRi6ZrsrrVZ09aOvg9uuYXF0Yxmzpx/tVFHOwdwWhUm1o
 ZHXORSM8ZC3eSLWeoBK3tY+byRpr44tmYuv2mpItIj/1RZnl5TwYOW928
 iuzLOEZfNuKsmIJ/bN1iCwZXfOEsGAvp41Ey2uC2iWwQi5bQVbScrTwkn
 rSoxJXAGxIb9HLHjRXwZrOwPnKsANKpHve817cK4fuymuNKXN4jTUzjjA w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188620387"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:42:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtmDj3RTPwjpXWLqmGxeZIb2Jb0yHJ3GNWpWn1kAkdWDkldg+FPqUTp6djb1EfIYM+1LP7CCWjnzA2uClBh8eQeY7gxBjV1XlYh16jevgAuxBfeepovVMjLw0+by4exFw0cPBhSvc2x+VU2B5lEPkjyCT7v2PNpKRWuBqg1BjHzxJk5MfQEUFiPOaC0xzMiU9/e252/cNEniVDSl/hsaFzCzd/PF8OBGBwwHWxAjrw7DlCSffz9DeigIaLMmNJe6fGJJRwaSuYpGO9+xWt4O/xiEyYUBEgHWb9keb6SVimFwfWGSutZX+EZZaqPlDDRCqVHk5+LXm+OXdI6fsJDg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pasaDxUrDGGL+adGOjziWJyX9WXrc8eQxAiAYer2fwo=;
 b=Qx104ld+5n+BWP4/d7pZOCwtgh05+9PXmpDLIakSrkyfs6gM3pZZFnulb3ga3vaxph55fOU0nIIMfyct4591gFjDZ93Z1HJEteTzX0gI77r++ae2LbWl958LWxYHaA3V6K3xFV8yM6IjvzZsR7vUvxI62JzexPEU0cZa/yugbAVnrwQzLET82QjEB31y/Zgovo5tlBW05Uv5D+pJ/Jydlv6+vPpisiJhwmNEpv6/w5AOJkqUfUVuqofGsvIUMB3y646TtubrtmyoTW4XFR3RKYA29lxgTscCYuinXZf3QUM4IlrMPYYJr7GmNzWrdZmjetF3dtO0KRzgpPE6SvAJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pasaDxUrDGGL+adGOjziWJyX9WXrc8eQxAiAYer2fwo=;
 b=PskkuEz9/nA3DkNNi8Edkp6wT9sLL2Q0eY81i9Kvd0K1kf64HQvQW09R3NrauTyNiUBxnuXLP9gqohVaD0sbkJFPbwmJnMLgMpT6CvLB0bCA60UAn9V64XyxtLMcvLw87ez4EdoBokU8Ys7gZmQ9kMasw9169/qzXP4QGWsObfY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8394.namprd04.prod.outlook.com (2603:10b6:303:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 06:42:58 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:42:58 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 01/22] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Tue, 26 Oct 2021 12:12:06 +0530
Message-Id: <20211026064227.2014502-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d4566e-d5ce-4e37-8eb4-08d9984bd8a5
X-MS-TrafficTypeDiagnostic: CO6PR04MB8394:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8394C75484F77C955C0533298D849@CO6PR04MB8394.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRNMuPsB0xzNrTsNoiaDzyhWC+X7AIDC8bY6R8PfuSZxHsIsYRRUwn7vzDh0MIDPHHSk79HSr4ily1zLP+9+/2phsCHrTMWbyaZ1gidHgcD0gQQVcQV+vEHU+AFDHAl+F7/FOYO0aIU7hn3572iBlRtBScMjcFsx9jDaRVKZkwUWlCbGObDnf2szepUrCNA4oVOR9ek7TLKfIqIHzRUUxMGDjfjvJth/Ux0DLE2mefWyZwy9rSjfnWt35FuzrW/qF9SCzSS+T3wo+1x4Uh3l+AI8+R9jpqvDZfH4FUoqxLeTkt97XP3nN/k6f5FBwOLikwjYhdX6vh/p+vy3BY3Gx3+GQ9i9+BftFdyhlusqcQ3bwKjCzAvXsXltnvoQ1W36w+11CNh0Qge+g5d7WnbLDTnlYzwK5VDjs4kBFL25Xuyn6KHRGa3ASM7ycuKS1Nn5XRNzlKsbsXobYSOf2i05+6Jp3IeBBUBvA5ujE/8wK7fiZU6k9lxise/fSR6+EfxAOU1bGwBdZLsrLOJ7mNz0Kb3LaL6rWW3zvFijLa3rrq/CE0zeiRsc6kq7mO/153wj5sCkRi9aHB6tBJexYz9/6Rb0Z+KbHf4X4AH9hE9NE3sfCBx7B3AYg70gyb8sWYmfAlWFoWIrIhgVOTBehB3jjn22EWJravbY8St57TXiroqSvBELrV26h7WyCFDQEp8+NjChrV+ZTq4yJpfggVbRxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8886007)(508600001)(6666004)(8936002)(44832011)(82960400001)(8676002)(5660300002)(55016002)(186003)(26005)(36756003)(1076003)(38350700002)(66556008)(38100700002)(66476007)(66946007)(316002)(52116002)(7696005)(4326008)(86362001)(54906003)(4744005)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KaD6ZrPMFjsgTLyRpOozE5BKGKrs+ooVwMfLplNvDYyKOTksWOSoej7vc1oH?=
 =?us-ascii?Q?uaRWXvQQnPzXdKyGLWDPL5JhZRCKG07B4PX6RWhmFAMdCD8mBfWDzqs/mdrt?=
 =?us-ascii?Q?kH98dr2hlSBPJjp2pTiMVocxYuHdaIfLUbbGulS2WzSOoww3fnoPXStjre8B?=
 =?us-ascii?Q?bbtNcFCIZY+fbvqDYodz7FaIzIACmiKdplXKrwoC1CkK5C7Wo7Cb9URD6WoY?=
 =?us-ascii?Q?Vvh/vzTWJdUFVita6XHYFAsLUarh/lobh0bT9NKIPxm0zL5zO2pcs3o/ZroW?=
 =?us-ascii?Q?iRIa7NVbTjg80aWC8zjnZrAD4C/MTLWBxcB4J73tB0MOOp+ZQYinTz+flLAR?=
 =?us-ascii?Q?2FRpTVbfGAtkXQFmLYIrOpcIiRa8jJl1BWfbNqfHfpGLVM1KDsgt/WSmOlZm?=
 =?us-ascii?Q?tDe2yl6WligwWxgTOSovsEdCSapQFY7t10VEXRR7/gzb1gEvnIqx602UI5r/?=
 =?us-ascii?Q?BXCFjoXNQKkXmxeEsU9zvvFP9nwmI9Pp8524R+0v73k9BB7xlq+Uzpeo1pll?=
 =?us-ascii?Q?e0VGUzBSUZCa9tbSDPsA0gsHwG3IzbsqHrSL0fA7OGKjmHn2WFdO9FSRRCzD?=
 =?us-ascii?Q?IlzkNc0pod5xFyea13Pd2OP73iSjb5u/qG4iUQMGnYxxBtrkyiqsW+CVWD7W?=
 =?us-ascii?Q?HEGYYmXYYMtmFWNy3g2yF7BYwN7pHNcLinnRYFGcvJb24MFobgIceGf7u7Bm?=
 =?us-ascii?Q?eotxlnrulOZ7dK08yK5hJDxvcaC1acimZv2FvGVLTD31uJNulJ7xglqsy3mA?=
 =?us-ascii?Q?Y6r1z6ecnbkVNeOZUaYgHkBPQ8EA+BMq/RdrkvuxNRrXrXVdDvB2GrvpRROq?=
 =?us-ascii?Q?aYQIYpPLzHfjOOpRtACt1eLGwlbpmbNxM+JYduSqPffTz4gMEtyUm52r22Ik?=
 =?us-ascii?Q?akpPAID6oHh+h1TOug3io00QwSZxoI1GHiA5GYEW9QGBbWfKGg6/rDM4df/X?=
 =?us-ascii?Q?pNOdvZDSg4YmYmmgEl21NU90DEUEUAVm0FZZJo4iqqoryQpAI33ggxOYvBuM?=
 =?us-ascii?Q?N+iNwpSKTRSFrwdgKZ/g2JkXbw7RtywkeQt/LRSWptX0dIVft/+yOPxYzJyM?=
 =?us-ascii?Q?7zA6uJ9Llpz5Rmf00mTgQuv24Fos60BblmWsoiB/2Fx2+Ly5XElBe8DJSHv5?=
 =?us-ascii?Q?35wnVjZHdfd2Yv+mnXluq4l5P6agPHHwi86VPfAjpE634TGRG1fWy6cjyTYM?=
 =?us-ascii?Q?7NcSIfQWVKB7clFa15gZNOhDXfwFkjaVa3lerxGVvhyHLc/zO3Q45HTYBfkG?=
 =?us-ascii?Q?0a3xefTxD/SAqpIlguI/2ErjR789ZONn9QK0mgrJ1KhsW+J3U/qeLIIWw3AA?=
 =?us-ascii?Q?W+y87j3kmNDz/ocA1mXdBANN5hewuJ6Ce2yhNlv8Q6j4+cKKxX3pIuWbcTUv?=
 =?us-ascii?Q?y8/XzvqeKQ1rQ0aFMCjoOVD6EYdcTjKdoAgePzJRvyHB3fnXtMrC0ICuC+uL?=
 =?us-ascii?Q?3c5DHaRgxn3VuAj26WJfLNVDR4g057gUfT9eoa5rr3O6cRjeze6IYt78UykV?=
 =?us-ascii?Q?izI0L8giEqqpMXG+BQRC+d+nbajVl50wIQcl8L42EpRNaHoqv5flwZjpx6zs?=
 =?us-ascii?Q?TrQD4HZxgRwKCJ/M/NJ7ihye7ITZdItNSGEkoYeZC/XcCYAgrPyyGRBJf+En?=
 =?us-ascii?Q?7QPKh7OVaavAWlmnskFH7xc=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d4566e-d5ce-4e37-8eb4-08d9984bd8a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:42:57.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPB4UrTEuAnEyVAnNE9gDN47t8y59ksyvwzjc8JRlVGUJ+rSuBUvimv9vnpX7JwiWXJqiflb0Lp7+WZaQu79rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8394
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Oct 2021 06:43:13 -0000

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..9dfc9b5eba 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


