Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBf-0003Ym-Po
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBU-0003V2-4I; Tue, 26 Oct 2021 02:43:44 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBS-00014K-0g; Tue, 26 Oct 2021 02:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230621; x=1666766621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/m+pb6B4KK3IKZzdxau0a214vI4jr9MbdzhsMRb843U=;
 b=XK6mOlOH+9f5Qv0BLkT9Tdemg+XHQwz2/TFs49PWLsVP5uZfEtlO7Oj+
 P8xMrbUzRV8jxeKQzj/tBPeHYMDPecB/vCv0TLP9zWeteA0rjRxpgCNFk
 SicGceRyEE4aHys5DoNvqk+wx2EAQ4moAi3zZZapRBqetH1/A2g6Hl7bO
 N+Cxi0JkicefW/CALHza/DpRtojJdVB/uQzmOjZ3ggkc0ufhY5ddFhZBh
 8e+r5KFcb5+mxCAZA3ZOD2CCQ6fEMylg8IMoS13SuCxmSv2LTmD4bodLy
 KS2VMGsu4QRGVwiQlBs3X8VX7Ie1LuANZxfjHTgSyIAtdMbiK05YXaDXu w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854774"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTdwq/qm7VmTyL45IgXp2GuXeeoHHcQbgczDvdLNXPMPvt1qFJYTTGzOE1KJB2rPbV2HPsNIX1xGxdJbGiS3AaFP7TGBsU8ffT1/Qm83IOsqWOKqnmZBixUbKrsKLEhMF6TIOt4HooYPh7+hu2sS84u+MiEEi/o93vfnSxmW9iqM3BHOnxWkxXGfRmSHXI6ezn4y33b3hrHDcHJE5OdCPRdpGM4mi96PRFkzENzpPDngDvUG9oqpApa3PhtgsfCgMi+5rFjHFCuWxWppDDICAXylJoUjonbf/S7puB3+sjGr5ldq/MfviMQlhQRUkuudO9AXy00NluxR0icW+zUC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20CN8QSGjuuUSn794mTU1Wold6bVUdDJ1zZ/1OXqtCU=;
 b=mMOuHGMOn++SiA1cP7ziF8l4FD1HFtPDvlQckB7tVkTLumzanAVmUX0evF0pOQgzc/8SQg9BHSjGsLRYfDEuQd9nEWOv3YOWe+yeMRJcv/0lQ1g0pdlb/sTvmT0Ut8DBCyAqaEejDleY67QRaemO5Rk7rkb1TvIPc/eV0HeDt1zeUpdxV2clJUfBl++Vw50KoWF33C1Z3tashqyUTNOve18yWyYVsOp8jr8JYZ3eD8asLxiPeOxykWtuqBHb91SI3A04Db49RH5MAvKIYnVYY6o31Gz7KxHD/kD6x5vco3WHR2A/GH1tg04EVMFiCG01U3c+LfpTDK90lE7uKxihRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20CN8QSGjuuUSn794mTU1Wold6bVUdDJ1zZ/1OXqtCU=;
 b=fVLDd68VOrO1AUrsm4uRUSX2qAkDhwmD3+UFyBasFqSVHMQLt8uiPhy1nON6vOv4or4xDMgIXAHG+H4JWYmshV977xWuPMhWpmlFqYE71Lm8SLJ3p7181Z73l3gw/NgeubWEZQYIELGHdfUTxYuRNIqi+n7nPPO6sOBY31sBVf0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:39 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:39 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 14/22] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Tue, 26 Oct 2021 12:12:19 +0530
Message-Id: <20211026064227.2014502-15-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6fc313a-d1d7-4e3d-e2cb-08d9984bf16d
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8379622092F4BB916C5A48548D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sU4vaIo63ms/CUxwpB1cYt6xumwS+Pdiqs4roIx5mwMHfAOLvinpSNLjMATc+sMlLhpQS0duznuf/0+VAlmRnIVWHqimwFQFFUpWXZ4jY6Nm5hIPTPzhmg32N+t00fvLU5Usm64WBQ62sQjRb5nxEWQ2fESQE1//5sMnPFNWfDmn39LrehG2f9biUGEFaD7vYYv0Vk5WsjrleSyzCCxNxGWeqlfeS3X/lfqSv1+XEKAHu9WWvj3IXHrU0ZzGREj3MuGBg4KUYWe0OV9hcojDUqizBh/Vb5Jl5yFI677HLVkD8W1A82Ywc8+SqgxPa5o5r+Pu22BtKNShaPZV/npNnyFEjud/wFTrw5SDF6ozKPOrFPKerPCGkZw8EyKJ2uqAD8zma8aMlGipfmUmlPB487db+l8O7nGdEbsaWnGN2Mkx0HbSvteLzr//iqemJ/0af/FBenltZ1fe+/w6f2ZCidY+F1CrzY+SKA9MhbwYSG2leTfASYy7hbYLMdZyydueBicgMA18KsD8Ku/ZYxpFTkovufOMsOQ5kDjsPh9DhodVp73BtEFjHFDT1M3onbmstchVUKncKcKdJypSnkKqbNCqM9LRSCu8QGKUKHiTZZhhxIfU4lWAhLvSWQErZoPbHSxaNomEEFUR5Se7q5wYH78BrYcdJJt9ma4xeHQqtI2AFE7C3gXUtb3bVlyI49lF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m5aMcan7qjCA1zS2nhYFxS2d65YV9ERAmsdjDfHZmL6o1OlNU0bHPun4RBwP?=
 =?us-ascii?Q?0NxmDaJetZiIQ4VfYc9/5a3+OceprFb1I1VPxLvleCIjfkQ1cH1+ZwB8mySU?=
 =?us-ascii?Q?XRhQ+j/UMkMVbrVn5lqNN07IiH1TObHINJCrsOw4AhJI496YjUn1osMN88CT?=
 =?us-ascii?Q?bI+uGqcYgQsbbuIIQyq62hI3MyHU5N859Q4oxK+etXUe+SyDYTkkHYLgBVdd?=
 =?us-ascii?Q?vIOBxeKrYu0PgIPyB025Lc6uKvFU3iXMiJkN3B/q7hlJ2szvxihXrQjZFbuc?=
 =?us-ascii?Q?N1WNjrHV9O9HUrdBKFquD8i+ltWvx1e17ZEbsGGT9JAn9LRpCdamkbruxwoE?=
 =?us-ascii?Q?LzoGqDtrQE23jh5yEArC0rZ3lrlrklELKSYyYzCxj8gSjaEmfmhd4Lz50hnX?=
 =?us-ascii?Q?Mq57/pLual3lrexHISrhH5Qh0UI4i9QrNknrg/dJcdD1IcOXW3qKw/4pHART?=
 =?us-ascii?Q?2vJbS/q3ZCO0ra2Jf9EzHB+tmt28E1Ae7TL3ZmRaMiVx36s04UQEukWH5v8x?=
 =?us-ascii?Q?JIJTWe8Wf4ygkTzl+dbuVXZ5wad32RRseZByxnfSwWE9QYUFrbBepVdgRP4d?=
 =?us-ascii?Q?DoqoCYPzA08ETp9++V/5n5qzXDBpmTD4mhNanAh84WgukOEkCfzRQb5/Q1dg?=
 =?us-ascii?Q?DWFw42+f+r6U/v/eqx3+rWqLnU2OB1HJ8Xf5dhLNHDOdnQuAXZPmH28Xn3+1?=
 =?us-ascii?Q?WB1zmElr24ouHFB2z8aWFrol5JjShWRh0zRsNvSrQQRZ1018/rCKKfuXJNr8?=
 =?us-ascii?Q?fHm1sRZSFebtOCIfuMEGHxSsRuYYWu3x5iGo5tO0OAfU49z7Di56FM97gz3r?=
 =?us-ascii?Q?V7AOAbDevQEgz1ctoXB6CsGKRgP4enKBCNa97FrkVfx2yzeTB8RgmsCVrw8B?=
 =?us-ascii?Q?PCbEnx9YSFd/haoIAHNh8E29uEpr8OgeU+EZO17MZ/5LWYjWm33srUsLzwb3?=
 =?us-ascii?Q?udqCNCHpYVJ89/XiFs3TUwA3UwLLDfiWRhbSig9rBfkkbM3JMh4iM+juLISZ?=
 =?us-ascii?Q?ka4DzbY3FdmHrL9X/8aCk9AUdAgC02BtRuOGBU+ikSE1OaAVU9kddwqyygkg?=
 =?us-ascii?Q?A51YbN3T+W4TBA6KUjmjGmvmCmDGznhMmmWmFQt5NFsuDBjUflvp6WD0JB1+?=
 =?us-ascii?Q?iVh7CkdzJUPfjp+kYlAUh0q5NDbP9iuSEY761oY1DiJH3czfw1fE8Qe8U6ZU?=
 =?us-ascii?Q?0QFeXmWsnpXfqdAeZ5Ae+rA7F4dWfY0QkZkduoykAjVOej1KOLLijjgMFcjw?=
 =?us-ascii?Q?on0kYHwC7tm5JlxYnjxkppkmwM7nMQmRMp2PzgHyLqSCYCJ8LVz6Z/QwZh3Z?=
 =?us-ascii?Q?CUC9v3QwU0W/Mwdq9brGvebpiAmp/AraYrOPV6gzLuyINTciLggvBsyQJzn5?=
 =?us-ascii?Q?RtHOCBl9zBfg2BF0LPEnbqJ1dj1TItTNLKW5UHG0hF+NXbeUR3oxCsv20tAv?=
 =?us-ascii?Q?ujI0JJh1ZJUi4UEKaOdlPQXJjn7derGbeXgFuFfRf5fYgq3/hucGzX5BId1k?=
 =?us-ascii?Q?kXA9E0S9/m2mvWHO67Ur/b1cIXNNd4tQ/08pU5DXks2vEv/Zaw8d9ndZtqxm?=
 =?us-ascii?Q?nqJGztyPIRVKAQ4guHGiSbodr4M7Pm1U98uqvxURfIVVambUFCO630+tzgMO?=
 =?us-ascii?Q?A5tTW1KFx/nfmWtKiKQllXQ=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fc313a-d1d7-4e3d-e2cb-08d9984bf16d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:39.3430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuWVgA3Zn3fLAePwa++bEmYQvJ6cVHT42VPs+C7/ENWbatCLgGKLVqi5lZjRpPJ6oDOaerp6tKOTp0AX5eABQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:44 -0000

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 174 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 184 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 21d9c536ef..bf688eb1ea 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -183,6 +183,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -212,6 +216,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e857d1e5..e72220fd0f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -854,6 +854,168 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
 
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    wr_mask &= ISELECT_MASK;
+    if (wr_mask) {
+        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+#if TARGET_LONG_BITS == 64
+    if (iselect & 0x1) {
+        return -EINVAL;
+    }
+#endif
+
+    nirqs = 4 * (TARGET_LONG_BITS / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (wr_mask) {
+        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i = 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-only
+             * zero. This means default priority order is always preferred
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) == ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(isel, iprio, val, new_val, wr_mask,
+                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgein),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2231,6 +2393,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2261,6 +2427,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2302,6 +2472,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index bc20960260..821e05d934 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -127,6 +127,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -184,6 +185,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


