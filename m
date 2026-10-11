Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F02BCA9ECF
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:26:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFyFe-00034S-Sa; Sun, 11 Oct 2026 14:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFX-0002zh-T2
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFW-0008Ts-5j
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:19 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69BINKWq2748905
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:sender:subject:to; s=qcppdkim1; bh=l3kV
 /dgEJvnaoguBfGnHN/xHN/fCnDtDoOefoJcVsDk=; b=cLt9HznLDyvbjJph5qRZ
 +R86OHFHLhxIZWwsph3AXr900nDwwdCrCzWFe9ca1TtpEbemrTKkd9fOLKvqCyMO
 R3HbTs2EKXE4Lntyq1zjNufPebMgpWEVdo7O+PM8vM8vpsSMvci1stynNoph2VWQ
 pJ7Z/KmhX1UZ4N9SicW6qPzlNzxSsoNUMpwtEVdRkFKZWeu+K8s0/HIPh5Y66Ybn
 z8gyaAZJ11sNnhJTZ5HfD/E0N1n2g84ZTLiEugfkY0QMB2+5R8gu7utuklvzbR89
 +GiJ0KmVzJ91LvnGNvY8tAmTlUcNWjQybdIHv86TCGtaankm+YVALaYa0+NKlJOX
 CA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjkeaj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-14fed306427so5643648c88.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 11:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791743176; x=1792347976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l3kV/dgEJvnaoguBfGnHN/xHN/fCnDtDoOefoJcVsDk=;
 b=AYmyfWIiZqptsvwBVeFdMbNPG3TVSw/pEKNRRZhIlfz3kejI5HnUHUOzZ7uDzkk16u
 z7fo73xxglh/vju8NtXX8apizjESCoRicq7E3kLcEKt+lOH6hb2DaItQvlhI30zH2K0H
 617x/ppn+P0lfPtcN1tnltGDYHUOAXOioS257BV89Tdy5v5rwlk48eFT51sUf60ubkEd
 LCxbEOHnzJXUOZ1x1DAUKZghuD2BiZ0Q3IaO8YbRBDKqXRkRSJAjq7e/3SpaaXKlht6z
 F502Pi9f2JwX8LAmAbuGZoFCsQfkkBlCyhPSdW0noFRggfuVsl4BRmDSAE2gQ4Nl9tFW
 /vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791743176; x=1792347976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=l3kV/dgEJvnaoguBfGnHN/xHN/fCnDtDoOefoJcVsDk=;
 b=qoGFEcWeKmfRQ/KHpz9SmZTMZnFitbuVdl90/L0glokCHfpHWaJpsyUJ7nAoeGbnwD
 lJKd+Wap9AmLKqZ702M99BfwF0Pg7WxPuCEe+uss3NdXHcf36aM+NEwEj4WZikBy7Ll1
 d+RjuB+SxuZpebSPtCtB1GPylGup+6eA/nP1gJo5T2obgLIe9h5dDCdZQvNU0GEUMP6w
 iWTruJbVehMh5A81a1C7PDmcCVrVfJDwKH0nFH5XmbsJZHH+793rSidhkJtalj1Oni0t
 Lq9O8h5+JQhg/Ii30pZta0puURnxc583ZNZLChJARjq3HexCNiOGviUWhkphejNtNU0y
 IjMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxe3938oHllSx6N5p1eZgXJV/pbIrkcoKhv1mnuHlQXt/GZuXeI8ybh3jittKXEpqdP2serYIiGiXSj@nongnu.org
X-Gm-Message-State: AFq9FYJ8oIijnJ7y89cWWVIeT7gRpa/7c4c8uk/Thx5i4kePzmkjvzdJ
 9vjUgT4etfraSR7o1clhqikfpAQ2NKzWV/ZdmmJJEbqqt8c9biXly7qluTokrOV4w4FpobWzvVn
 dmo24bHFHZ24SvLL1X8H0aRVbtjqb6hSF4fbNVPkeGVTQOc3D9Gx1fACr+kBWAouDdQ==
X-Gm-Gg: AYBFou2MUDmP6Kg5admZPj5eAaCG5EVpgmMvamQfVvA2DPJNVo3cm2X8P3G/+ZL9Aw9
 LmflgrK/Cbch8Un7jiR2iftbPDizeV1EU2WD2sNgatFpJUp+S5hxiYPHZMegtscl6qW0fRDqtRW
 G57qZl7nNJbhXQLQE8WP+BxVIn6+etB/jvBUWHRrcLvVIdi2wu/Sn5fIm6oEuRjSuI9ZYonUbzn
 W7g8PNjP9Ox/ut2nZg5wsbvv/o5cdcwAdv6AZ/qWoP26IcmsxNVU+Py9SrSAj/EZjKhbP+eDzLN
 VYzVZHUtejGkBIKIHTy2xW6i070ZpNRtjbmp0bA9OJ/T+VbuGGd62VRjZdoClxnYfJWxMmJFiH7
 5d4bFQNaKuNCjMIuohQ7mG5/gQnxMeLga43ZNql2S/05ntYWX5JkCsoU=
X-Received: by 2002:a05:701b:2607:b0:144:f096:4dd1 with SMTP id
 a92af1059eb24-16a611c76a1mr9230041c88.41.1791743175796; 
 Sun, 11 Oct 2026 11:26:15 -0700 (PDT)
X-Received: by 2002:a05:701b:2607:b0:144:f096:4dd1 with SMTP id
 a92af1059eb24-16a611c76a1mr9230011c88.41.1791743175212; 
 Sun, 11 Oct 2026 11:26:15 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a5866477sm22505284c88.22.2026.10.11.11.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:26:14 -0700 (PDT)
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 3/4] tests/qtest/bios-tables-test: Update riscv64 virt PPTT
 golden reference
Date: Sun, 11 Oct 2026 23:55:51 +0530
Message-ID: <20261011182552.1071742-4-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX6a2isaagP9sW
 35QeWYmWppLDFJRcINhw+rB+5aBMcuJ/f9NfVqWVajWAPXE8T5QpE9S0sOkhBtVhjMtL3MTvkky
 YaXPgelz+OPYhjfdJXBpLVKltNH5/hAJjJM8piWoIMKfoL2TscVEGL9IE8ovH4fWQTSX0aSCzCO
 wmMgQ2z6+y4y7JlfW9jWwk/7o78LWyu/IF8cvwXZkDVMnuz4rNYBGljIEtoauxiPzic6Sz9cGd9
 p81AE8g/RAa2P62V9ybeZYtoTt0tAh/r6bDZr0VZrTyvi1YdCwkUX5DedO5jdmXy8phWAc5DGgq
 HSA+TdOXMXVaZQOAj94QxQG+bamoxP3tRKYGESxqIKDA+J9M72a3q4IlfctBIBH2doDI08t9/hO
 GlV/TVB5Y8j1VwVIxg4Srfe86hxQzTf7zHANyu4SGGD5DNIrsxpbuh1V/TRUm1OCEzkihTlK95Z
 qiBQPiPmayWYseFA4lw==
X-Proofpoint-ORIG-GUID: PFouAp3EPyHAzpf2jLClyegtc9WPJ7lr
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acbd4c8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7nS_kZPvwonqTfo6PMEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: PFouAp3EPyHAzpf2jLClyegtc9WPJ7lr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX5th9m4as7H3c
 eMkVYJoO4XIfQQ2sNkD48NkJpqaKf2Ya14cB8H3ALvp2CZXsMoQTk1FI7+ygPbPjyXYMHkK+QZ9
 gDwLrqUWT0R5DeChejMvqH7XjgsaYb8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110073
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-to:  Sunil V L <sunilvl@oss.qualcomm.com>
From:  Sunil V L via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Sunil V L <sunilvl@oss.qualcomm.com>

Update the riscv64 virt SPCR golden reference file to have the fix for
the UART register width.

Diffs from iasl:

+/*
+ * Intel ACPI Component Architecture
+ * AML/ASL+ Disassembler version 20230628 (64-bit version)
+ * Copyright (c) 2000 - 2023 Intel Corporation
+ *
+ * Disassembly of /tmp/aml-DN3NW3, Sun Oct 11 23:01:04 2026
+ *
+ * ACPI Data Table [PPTT]
+ *
+ * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
+ */
+
+[000h 0000 004h]                   Signature : "PPTT"    [Processor Properties Topology Table]
+[004h 0004 004h]                Table Length : 00000060
+[008h 0008 001h]                    Revision : 02
+[009h 0009 001h]                    Checksum : 27
+[00Ah 0010 006h]                      Oem ID : "BOCHS "
+[010h 0016 008h]                Oem Table ID : "BXPC    "
+[018h 0024 004h]                Oem Revision : 00000001
+[01Ch 0028 004h]             Asl Compiler ID : "BXPC"
+[020h 0032 004h]       Asl Compiler Revision : 00000001
+
+
+[024h 0036 001h]               Subtable Type : 00 [Processor Hierarchy Node]
+[025h 0037 001h]                      Length : 14
+[026h 0038 002h]                    Reserved : 0000
+[028h 0040 004h]       Flags (decoded below) : 00000011
+                            Physical package : 1
+                     ACPI Processor ID valid : 0
+                       Processor is a thread : 0
+                              Node is a leaf : 0
+                    Identical Implementation : 1
+[02Ch 0044 004h]                      Parent : 00000000
+[030h 0048 004h]           ACPI Processor ID : 00000000
+[034h 0052 004h]     Private Resource Number : 00000000
+
+[038h 0056 001h]               Subtable Type : 00 [Processor Hierarchy Node]
+[039h 0057 001h]                      Length : 14
+[03Ah 0058 002h]                    Reserved : 0000
+[03Ch 0060 004h]       Flags (decoded below) : 00000011
+                            Physical package : 1
+                     ACPI Processor ID valid : 0
+                       Processor is a thread : 0
+                              Node is a leaf : 0
+                    Identical Implementation : 1
+[040h 0064 004h]                      Parent : 00000024
+[044h 0068 004h]           ACPI Processor ID : 00000000
+[048h 0072 004h]     Private Resource Number : 00000000
+
+[04Ch 0076 001h]               Subtable Type : 00 [Processor Hierarchy Node]
+[04Dh 0077 001h]                      Length : 14
+[04Eh 0078 002h]                    Reserved : 0000
+[050h 0080 004h]       Flags (decoded below) : 0000000A
+                            Physical package : 0
+                     ACPI Processor ID valid : 1
+                       Processor is a thread : 0
+                              Node is a leaf : 1
+                    Identical Implementation : 0
+[054h 0084 004h]                      Parent : 00000038
+[058h 0088 004h]           ACPI Processor ID : 00000000
+[05Ch 0092 004h]     Private Resource Number : 00000000
+
+Raw Table Data: Length 96 (0x60)
+
+    0000: 50 50 54 54 60 00 00 00 02 27 42 4F 43 48 53 20  // PPTT`....'BOCHS
+    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
+    0020: 01 00 00 00 00 14 00 00 11 00 00 00 00 00 00 00  // ................
+    0030: 00 00 00 00 00 00 00 00 00 14 00 00 11 00 00 00  // ................
+    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
+    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 tests/data/acpi/riscv64/virt/PPTT           | Bin 0 -> 96 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/riscv64/virt/PPTT b/tests/data/acpi/riscv64/virt/PPTT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..15598a9b8a3cc0cdd50bc1f77c73ae0ba728a272 100644
GIT binary patch
literal 96
zcmWFt2nk7GU|?WUck*}k2v%^42yj*a0!E-1hz+6{L>L$ZK{PUeim9N9aRK=jNMZmJ
Cwg&+K

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 94be7a69a22e..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/riscv64/virt/PPTT",
-- 
2.43.0


