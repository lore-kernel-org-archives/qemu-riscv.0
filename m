Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgs-0002V5-PQ
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgr-0002Ri-SF; Sat, 23 Oct 2021 04:47:45 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgp-0006xZ-JK; Sat, 23 Oct 2021 04:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978863; x=1666514863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nx9wCl2PjPZzfxgMbTLUztdO8ypGA2pn2dH8yP9taUo=;
 b=ZAwqFyoAxL2VbeP6agoijm01a67WL35R8WNvbPwlpsleAZFJqGjfoupx
 URrb0YkBTHRpAqMHPi/I5mrMpwcd3/zdyRYSspBLv5/Dwfd+OwYcd0vHu
 HGXFPHWyESr7910fChCzbSJS8ZhpBauEbXpf00cRblhRTiNPI/HQh3EuZ
 KLThreOd8n3KBSr18sWkAaxpzZQa8R6POz8lWwpnbJGk0w1OS9ZUt6yMI
 1PUF+4M7YVXKkcgqYPq6xjY6oxavLNj4fJaFPkdT4/2+N3NSJWAmZJdio
 mxQdMQbFmmMU1rWvr4l4fw2FM5VJElb7/4V6p6G6UAQZitBvmmzMWQnij A==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398053"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2za67qG95e7IPFHRlnv5lZs4ElB9eza1klV7U2x4Iw4nao2O0Wz8IGb610sCiZP+83qVuVTHj0KieQ1EyS9foGFSoPi8Kd5K3IMqxAPTrljEACeocQCVm7QYMPWxJ+hbOEGmn7vjND6fW+xzNqPVb2WcPuYP9S/hZ4wMv+11WlkdCmS6eBIJw6FF6mf3VRANfemVZcGN4z1VLFS0h3Go+c+VSIV7fzQzST6FMlCWp+d9dIXIKfRMySkNkPLW5rZNYO6mDu3vPbD9MlvnQuOtUa86wAYiHqwMjpldm+mMQw9NEsZOr21U4QlYPLvhZlbH2Pwb0VA9HsiL5jBsTGbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To9GxHvfKRpL30vajheq0UdXgtqFpVnZyox+gEMsUAg=;
 b=J/uUctjNRq2ydDZ+ylA5EpOMP2afgSW8mNtTk0R9/PmddWL/DB3PAEjkLU1xkSq4GoVQsrUbf6Z7hNJLjXGA+Cyul/QM6lRfnDOJuQWI9GIXBX+KkT/HNefKgF8wAKN5rtUQDlFgYm690ZejSL9OxPm/xITKqz2riDX8VEQTS+LITfv4RcolxmIdPJqMwJ8Ge/ML7bz7RX8+RFuVy/bjkEiR1SOesWPFuyhn2VrYuy7TzBVZtNbCrkA8lg6DAp2tNGturywCu/74JvwfrHtgowgRnW0978MwTfFdri+DZ5cXUGaZWxq4ZoktwnrUM8Lw5ZxmxechBDWy8Bm/nIW/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To9GxHvfKRpL30vajheq0UdXgtqFpVnZyox+gEMsUAg=;
 b=kdrzeN7tM6Y7QqJTlmlVURQUqN3ngMRXJW5W1zlXoUXoyGxJGeb+4aTtRHWkC5oIEH23TqMoAszwfbd0USsUhoAClqH2AP/rDe36unbVzIIYfoxE8FR9Oa/J2gaJUfdHAOor+o52GxLNve6JISVRNYJjCk56KhhLQ/28QWWD+10=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:40 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 06/22] target/riscv: Add AIA cpu feature
Date: Sat, 23 Oct 2021 14:16:22 +0530
Message-Id: <20211023084638.1697057-7-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cbb8b3a-6733-4cd7-d137-08d99601c544
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8345628CC435E5DA83FD0C5E8D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6899eGAHReOaciqZsDVRr/67owX1qCNN80qNHGa0PsXBaUiFMIRHLvSlGsZ5N+sg2xZ6284/06PDOQdJdFDHcrds3R45ZK2K7UNd6yPV92va+G4XjY2HPARpjAlObCsYPgRJMTo6sIIKWd9Iks04CSr04LjX+58KpOISpxp3Dj8cq5yVuGaT5GRDn1xcTwl49cm7V/fE1kWYIz2OmR3008W2wp+kr6Vs2t7TTBSmzRyqNzZPCpEXfdyd02BdEhAcLaBHsfIR0Gl6EYPi+ILKS9DaQKH92WxrXvZNseBGjfdqWwMxm8oO1e0FIpvYV6N/xp3l8JiRUxNJtxpWFDc/AgZzG8Wf1Ykm335m1EHA0UJMe1hRWB2c+XofaSOuWOEE22KDBBwSzvC5L+xc5TaRYTuzI8bNn7bldPHXe6DDb2v7nPIgdDwsaC6MD3seSKXHnTJf5uIMCiQ1Z6ZTeQQeaZIceZh/H4iTkACYvXmsTY0ELHLAj18F2cTQgc6347ZxY7LlJaN6u/S18gyr8tGjebeIRMkgvpz+7zSOPr8EFnRObOJT3UcrPHsBEqAYerBSP7h5BTotlGvOLLqGm0uhJiEU9vd/OliKlfqmcNO2meFnghcmc/+O20CD5uJQQE8PziPzAgvljAjf5iRKpXXWFWwakyL/i7y0bRBXTI2kqQ7iFBu2wog3cYujBIvyxcG1M9WAbT28jydHvbcHbQG/Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(4744005)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?njaVmuh5jPaJig5ijfJDgcYbvuS2leWFKGEeue4RBnfL7bZgOkan1Rnnz9Nd?=
 =?us-ascii?Q?/RLVB7xze0z0VfLBhijOts1Uijq5CyxmMEh+bLl74w6TygUWEiEp7HZrWgml?=
 =?us-ascii?Q?nVKNmB0eYygvBbXGsfovwq+UzQNSNxjVq9Qv7iEeHXlXLTSJ7agPiWmWZDXq?=
 =?us-ascii?Q?lHPE3a2c+9Q6l3eEpgUzJjPgfDABfLIogT9QxpgHN+xGQ1RqGFnAjroJbnSw?=
 =?us-ascii?Q?2043R4usPpjstG52QVU3QSA5QB/u5qS5VmTUPibnhcJDpGhWlx1Gn96hV1vJ?=
 =?us-ascii?Q?TO6gBv+vNeUaQtHnEoUxqqww690PHTheZxnmAmc3RIk6yvg2jgtxFmbop2lf?=
 =?us-ascii?Q?eb9dkuIeEgOPC35g36ecqpyHhY1tQJzbEYgZL8JSKNlngdltSmUuHWpkwMDv?=
 =?us-ascii?Q?DXopei0YKIR1Yu19RuKVi7pqigTtnudK3dgpq6QHeu1KAxnrU8cn+RzJe9b1?=
 =?us-ascii?Q?fsrRHTVDIO8VdO6Q4Y5P2FK274A+47LVU9offvWDuywGVsg6Y/1oMYvlgIJf?=
 =?us-ascii?Q?zYFdMHYjb3r5glizILQlud2hQCX3X2KUlWTDcpZz7oFr2+vsxXL/ir14uc6I?=
 =?us-ascii?Q?Fa2Vk/lm6XnaK4Q3NNzm/STNNTmv90dv3R5lDMirk58fRWRbddMMaB6QGroM?=
 =?us-ascii?Q?BkSC99t0U0avPPaYTX8WfZdlgOZ8p3tdCzrFTkhV0lrLY2JNEdhVdE8d3N7x?=
 =?us-ascii?Q?Aj6GG0j6aLFfDNSoL1bmrab+95D/ZAnMPUDZse2TVPXWhCkrUoCZrFDtSNWd?=
 =?us-ascii?Q?PgZ9Y4GZ87Izd7sW6hSrIecnpF3pkoreY/WAkBpVNyjih8POleRYBtVW/Pyo?=
 =?us-ascii?Q?Sm0ef3z3y2QS3sqEvc/praP+hgVLEy73KUPwsTadDK0dL7tp6lQC+pA6aQTf?=
 =?us-ascii?Q?X43+g7ggqVhYQJeslEtWkPe7o383TB2KIf6v7SahYlyjSjz45FaQTNOcf2IQ?=
 =?us-ascii?Q?gcwlF4mdXYY+conwZ0OWB7bIJUMjiFlLRsTKWmJgM3xuEHDXxYuj8VI9V1jk?=
 =?us-ascii?Q?Cs2U9p7x7Qr6/iKXw7zOAzNcqdNYocgLgSiYhi+REs5tfCp4cWaYwPPS86Lv?=
 =?us-ascii?Q?y2joh1BZ9D7sisHN5m2Iu2y2lNWARSYkRuwAkcTFvLuAemTFIdqJhiqhdxfZ?=
 =?us-ascii?Q?XmktE162Fys5EB8/pzJ44xkbJ6/XXkKYrgS52haWNyWHEBdY+yB9bT3BsE7A?=
 =?us-ascii?Q?8ugdsJQrnCmRrQVgXGINSRdKECwYc9biCNIjOCud8jnK4+J7Lpti8ixHTB8H?=
 =?us-ascii?Q?Zn9HN0C6cCtFi8NeWMIE1jIVngfkJhINSyWCqgisP0yj7s3jYgQ9RfsBB5ty?=
 =?us-ascii?Q?MPudkZJM9NrP0wA+cNaRPAFBLqOr8ST+jvB1P/1AqjAqnnOipl+egH7REe70?=
 =?us-ascii?Q?7usr7Olq/TJd1KfBLGxrShaUi1CDkdn8ZzpZ6BIRehOkvAQXtB7EbH1f4Fsx?=
 =?us-ascii?Q?U2FOErIPoG0+4V+luR0smJ1sr5bZ9M503GO7NpouthIKXgYptCANgPQX1l/S?=
 =?us-ascii?Q?tRp7qIkKTt2yPloGIZ7Oww4HX+bdgMzbGHg0UW/+TEcy48aw2mVD/QtBLwwu?=
 =?us-ascii?Q?9z+5Cvi07/vwtaiYz71zgMNF9TdDsxaicibKBLNITKIgxsPa/ozSv2loKmE6?=
 =?us-ascii?Q?bMickQVHrcNOzdltxjSfad8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb8b3a-6733-4cd7-d137-08d99601c544
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:40.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLol95xHRXsfqEeVIiDJK/k525rlfCRXs0d9JIGYGCATS0tZHF6niMWeEJcDajW7cs/ZC9njrz7O7/VO+RC9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:46 -0000

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cc035a8897..7182fadd21 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -74,7 +74,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


