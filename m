Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtrj-0003qv-I2
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrh-0003qe-92; Fri, 10 Dec 2021 23:20:05 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtre-0001Y5-57; Fri, 10 Dec 2021 23:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196402; x=1670732402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0DykbVMGDmQXMjlMl/xXQF8Z496TJTBmILAKOLJ2BEM=;
 b=lUqq2h9PNnaj4FrhWP2QExHJLsZsMJEKW4F1gxXX9Q3FSN5nycmsvLXW
 2Qlbde34XfSFhDwR3IjoNfFSqUK/ZnqyYiSZjSjUYM8TqZJWSNMzcxuST
 wOQt/FcIeyTocuQVozpdRUeTqaqbFpNoDHp8UAGkXt0Qx2Z5otnoh8fNg
 7iREgg7FAA7J92i3mjmJ78RM5wzxP95mEVCLzxUnMteHbYO8SvptY/V5w
 dd3Ty9SEGxfoQqjuKaPQD8UMmzkOQSerk1dby1tyAv3JH9Ppe3m4aqlX6
 zAVc7rw9xzaOzqEm1VBQCnLHpQm/QeJj4Ojz2AcxJHvdgUNqVFQ+K55n2 Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970358"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:19:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkfRpotqtacIkMUzTKjUXiHowA4/GamrtGOA5MYTIxMKQynmJfflxcgmzrCRuEsMiCg5KB2u4+BN47qBsabZr3DFfujEF8CFKoPn4wn1AMHCKmHxFVmbdCNbOlTzUOIArYt9Qmo8Zr5NlCO/EVoKJv8pccg0zJQhL6nm2/CCWqfEKH9ZZpSO9atsk90TeAOsjOcMV8iXQm0LLg/wDt1WIKHHIiptrZWBlmRJpQ1mkBTQi5FlIVVcOpabHshwcFyoDIo2UrmQHkN/8QxcSVW/BjRVEhWP0YyrkHMFtiKxYg8y21/FcTE3UbteCKF5fAdKskpRlgW3VajDeCBj6450oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5leADCzlzQIucpedF2hgyHTqRLOBubJ1FpN4u3xkoo=;
 b=fb0hwSDoYF8XH6HOSgMzICXUKE1Vycq0EjZqq/Sofb8sKZgAYivxQsUr6T56ZJ7BLKXZyLje6ggHqeEs8YTDKSxHB5GinBPCFXYR9CKmc0EAHRDAFpos+FcwJ6lT9IkKiHkMbMnkVJ9UUS9u9e6SdCTqqw5M+joGSUcFU4x+pqYxfwm/z1VdBQKZsWqFedU1iheOGQf5Q46XLVYY7ZWEe3TlbtAGUssOLQAHCJX+tvXF+XU02W2Oq8F8zpUGK6vuhhi106JHesIgpW9XMeonyqqVPcLqjCsQ7j0++hA9mv1DCFNCmbojfVXUKzIE1grB5x8ZwJnDYMFtO5yAFPCo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5leADCzlzQIucpedF2hgyHTqRLOBubJ1FpN4u3xkoo=;
 b=TpGV0+uvZtqHbm285dLZpUQ1wnhblu0TkndPSIfzKR3gI0UUkYKRnwofkBnVi4BrIXDg29y45mrwRJlf1RTlKI44c12wzB5d6/+HYiepRzecF1oGZi6graUEJ8v5pLrxb39XwT6EwmmnV356VTQucx6lH4yHFT1XC0ceC3YHUEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:19:58 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:19:58 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Sat, 11 Dec 2021 09:48:55 +0530
Message-Id: <20211211041917.135345-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b11c1caa-065c-4ef9-0327-08d9bc5d7d92
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8265B242BADBBFA0FFB2E4CC8D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1jfQ07z3e5Bjk1Un05lYYo0ceWTZZfLixyR70BT/5jbffcaAO2AO9x6u7FfT6VqAIneJjpL8Tx4aVyNUtJiarLZYG4HqE6vKDlqCCAVclRXrEcPoVGxdMsOjbiLhQiq1MrOJOa6y0FjDakDe5x/oEmHrJloX7NHLnXiX5y1aDiUOTPlD18enjbB+FVSobQKSGmC95MYeZNTniKnubZsdv76uFUpxoix5AzXklhOIMwmsUKlqFzPklAXuqPyqNFD9NpVnx+ipbRWNRGUWLgb/40D1aBCSx2tuVKGpCcnymZ2XgBGKjNfd3Y6wdbSssQszDUXxym4I7XY3t0j5AV0OeolLzTkbtuEN0kJ8AXQakgisHaAEiu30DluUxUXmMiNBjoyi8dhxnnWW/iLRPbl7o11mbGQO2dnvyx9fzTGN5gmD+FYfidRWNMVr3cq/7L2UVY6BGPlOLiOS20m3+J+6pmubmVBQsM9RWiwRkaVLvigkBT4r0S8RFrBgkZ/Xzf88gEddej/7bAJNHu7C3UBZCGh9gaqK3ZOgDAbthzz7xnM+BjdKtuOXOwN05xqTcjUwHnYMcZjk6ur6ZY5SYDczCJOaI7cAILTkwcNcYkGXqL2zCcCbQNiO3C6OuCOhqjvt2ZT1VR0d6lVZZQWwHqzCXXKvdnn8xcUS+VDUzcpOKgstojxM0gzmvO66T9qDYbd1IzGOj+Lq+tW6+8JmDf8BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(110136005)(316002)(4744005)(82960400001)(83380400001)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6666004)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXd5BrClfL2sg4g91RguPJaG1G2D++ZCeyw+/JSRu2DXi6+nV99fKWwwaJ7z?=
 =?us-ascii?Q?ZyfrPlrA7UVaiUDNNDdZK1mVy0l0lo4gIzbACi3AwvoJ95Ed0O0yanykD+kj?=
 =?us-ascii?Q?QS/4dxBqF2BG2SjiY4Oycl+Q9cu6sJ8mU42WabEVxAX1oR8mOwVjsD55V27t?=
 =?us-ascii?Q?JjhlfadQnDpXxURbSZsBnH5GWXzM8W1ikLeovCK6Q7qHq8fp9rrht7LMxAOy?=
 =?us-ascii?Q?DesCl9kw6rttDKU+R+egqLTzVJgb84VRVgQErRlqGfi+qssSEhcFUXO/qZOw?=
 =?us-ascii?Q?YwJaH34y9EqL9neoofIptkjvVjWgK+4IHx+8nApcfz0OF0JmgbC+aPco2Tak?=
 =?us-ascii?Q?mzvP4glQzxANkKYYYDcHZCfZ3YFVeX6zIEW7g/swaKhsRb6fVVLpU0TK1nvN?=
 =?us-ascii?Q?Zp5YkfITFZFOT2BMeYIzs1PX7+LK/8+x8DfXVyWgOEgGvWRAqPBz72WAIzbX?=
 =?us-ascii?Q?DVU+/jrKlNSd+w0myXtlBevF9RHawX1E4Jz6TXWwOnxK5YlfahpnRUvNdCWZ?=
 =?us-ascii?Q?LpQ1pbva30bU5JP1zIbIZKWNU6Ymtgcfm4AxyBNispOppwdN8GCwKwqPlZ/P?=
 =?us-ascii?Q?9T3upirH4ZgCbayhsl4egInHYRgovQ+PsT43QHisy+Y8zs+n6gJacdV2++w6?=
 =?us-ascii?Q?5GSdheR2p9UGtnKzOSRBw5T88fW5IaVB485fXaxKD6U9xto8wVMNNK1+eI2C?=
 =?us-ascii?Q?zTUatWsTbIGU5Sq7hhnLdOXaCrhu6e6su33RevD73uvHKbMC2jVAZKFK6sbC?=
 =?us-ascii?Q?vTYJ8HrJHLWimdS3V/iaCKue+eUoBzzN5G9Jl1ZLfFUbAi4pvNzngbKl2/cK?=
 =?us-ascii?Q?B1hrPKzeA6+pgvlWqVZY3kfk9qoAcAu5f1k3LRueV79KTKPzdfPfE5VKtPlw?=
 =?us-ascii?Q?H6kJ8pOh1JPJl3fI6u4sZn9NTD9/0pM8onWFFQW8ytS/2sWDcQ4XDt+VRY1y?=
 =?us-ascii?Q?8BeX4NHG5NR73mw6RFTTVM8C7NZumKR6XV4N2a2Jl+tCmVOlNSCMg89v+uwN?=
 =?us-ascii?Q?Mg40ToYL1YPEQdHZJ6ARCdNqzmTkGM7j9x19Ey3/AGnuRE5LI1TBM6voyJ2E?=
 =?us-ascii?Q?yGKzw40Tn23SapYfM1lapLRg95QVe6JI1kPsh09BnSXYIyD0OhoNoLuSKETn?=
 =?us-ascii?Q?tIplxlE91hKWdoZacMW76+MSgQVSx9IpDr+q5s7Em63yCyM2iYf1rmzlyxZy?=
 =?us-ascii?Q?RBaussiMqJ6qcKdsvo/ScgKFP6QbQcbjFzBW3/+7lKElE++sMqXd130YleBO?=
 =?us-ascii?Q?UP/3JfPZZJaj+VaVKe8uTzm7BRUmn34H+o7gV1PT+mNP6OdhyZAz/jS9oQGY?=
 =?us-ascii?Q?u7u9aziUmy+onsOIFcFLIiTYDZYO7UpU7sQUzPv+hZ1aBITg/h50V5QgMIIj?=
 =?us-ascii?Q?UKWaXC14JY/RO4HaaRb2dydSZdNP4CTwt6iLQ8tTk0Y5yuGfath63XdxZ3Uc?=
 =?us-ascii?Q?vZEn1/4cLjnBAv86VqwHqefMzz2C8alXcEoP2EWmv756b39Dx8S716BWLWWf?=
 =?us-ascii?Q?SPg2k2IKZt/W6rX9pgY00V3EOOKoatRnr4lseA6eaXemAx13seVHiPvONMvY?=
 =?us-ascii?Q?A1d1VWj9Ofxvm99UO8uclDOMAtEFtTvyaKS3gGGsAkniL13wA/04NBVsI3TS?=
 =?us-ascii?Q?sXnv8EXsbC3neNr9JGm2EZg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11c1caa-065c-4ef9-0327-08d9bc5d7d92
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:19:58.0899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6/G1Zu5MjFV4pjmb6RlABNfwcY0iRmWZkbjr+IkvMf9AO8n6tZx+inM0SVUBPvfRKtJNvZ8Zr/cOow3SYWbcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8265
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Dec 2021 04:20:05 -0000

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..d170c7fd08 100644
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


