Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D971CD98D2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 00:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdhC-00020l-BF; Tue, 16 Jun 2026 19:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdh9-0001zC-RJ
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdh7-00082S-U2
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:51 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GLT94w198203
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FINgkC03CpX
 HsjEzGruDQiIM72ZDqLif+q+uMuG+YvE=; b=g+ldN1E3iw6pCtQxYiNoBjhsfXq
 hEAsdnN1ZM49st4G+oatsxvx5CPbTYOJy0v97MxuBKKOLBTBaZ/0LOqUpCCup281
 tZFzVJyjtg4Iwejoh/ua95mUQx8MjSQvFDAfZ5WCkQ6rwXyjl3d8IT9iTz8qeko9
 G4WciuTe31fZ91TOcbGw9cTmkJRez5Iu77yhuFcNKSWh+8tCrd/lCiFtePd1MBqd
 PZ/6++TfS4tQgfEd45kPOEk+1iAnYYFL3xo5svXJ2aMC0Qk2rOauXCcPV0485Gzu
 2ulC5LVLaP10nLmSWGTewootOOw1Ou5DSs8h6zpG+xbdSeDzA2sVYvN8oEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer0dxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cce2b4c290so96952766d6.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781654388; x=1782259188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FINgkC03CpXHsjEzGruDQiIM72ZDqLif+q+uMuG+YvE=;
 b=DoWel17vqZ/jt5VsoIFHFA9TIGsC5J6qQTqNv+8uX2tiCQXZpnf2Sg9MQykgqGrkLH
 ue8Kzjsrwejub2lUOicDJ8iYmgOPGibKks9pmPcbVqB1qGEqsSJi+iqu7NQK6qpLHtHi
 1l7Ta5NNx9zyveN3xAXf2P8d/VXjK1jouBBMjQQyModc+tDb7VIShntqwic99Os+YYAP
 9SIT4YAluMVDTPnZey08ETgYtHDUZOdKQTKcHOtpQ6SZP80/UGndgcYheBZqQF06KHj/
 EbDUX4oZn3HBadKsEyLCCXOr6N9onyUp4NwBHkK/lAr7FRPTwhZpITJ/zEQc8IxHSFNr
 96PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654388; x=1782259188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FINgkC03CpXHsjEzGruDQiIM72ZDqLif+q+uMuG+YvE=;
 b=ob2JQtSY3mv+lNQALeS13LTzSIYThc0Xt/J+J60EoEIk6ypkzy9Xs9zzuCHbys3Rh7
 6WuRnGqNzfIS0tol5jEXb8C8kGDXAQgJTMc5JzUz8NomfmuD+Xxb1C72fETxF2vXNnOt
 QoXxsWgL5gvAqm3P8nqkDkex1yWfLWvjiiz/5sj/1ecVVhNcAQGjMmZTZzi2uwL6e/2A
 0wNxCR9tymDZy/WgsWRzlxL7+TThYGc0mhJtMhvee9XHjckJo/vweyQYSmf4AxXkPRXh
 qFuU19hN7/izjtIVsPcoyZpgvNwW0yvfZNTwI/OWTGKQTaNIM40HnpuwRm2zJTJM07eA
 +t7Q==
X-Gm-Message-State: AOJu0Yzm3oZI3WcBv1Cwpx38uG+qluNZUDnFq3RkUnQ5fUPQl+VgD5kL
 FtNrrGY3UvXp7BPA6MiWrJmUKOm3EBBOl4ijgAKFZsZf6cnmWxuF6rVYa+VWtvEg/VBtuF5B/f4
 cR4Yw/ut9aMEeu2EPA8m/+jzM6z32gH0FDHNkMGz7tGlbEZve8TrCd7o14A==
X-Gm-Gg: AfdE7ckN2diiqju1ownYbFsABvN0qlUqq2SeD3fgB9GFBvOIwWIVTAhybXjHVtLsJdZ
 vjic/Kx+0yH4TX/dsXVJgqgUxZ8wU425MiYxfab5KCn/7kezVRhQO9FoBzNN+uYWYwtMVjoWytU
 N+V3A9YEXKM1YB5jhR2P8CZTeGTu7uGdEno49+KgzgLuDCfJknzJUVPHIOdslwBOESH0ejsXo9q
 aWjRSJkBRE63t9dj53YXck9TnOohRjy2QUPAwvUSnTWotUAMt0AYn0TG6UPVJeenDKnygvUEGGd
 Cvc0RssL+a6hkE8cgVVV2R+g76lpWXAhbDxptz54csnTY1zaIiPc9LXfo/wX95xMvTeevDFlxtp
 rrwQPBZ3Fy9rG41m/loS2A+qoaA9wahJyOuPlsJR+8/BmLoCppzyUtl4PjC4=
X-Received: by 2002:a05:6214:55c4:b0:8be:7779:d1b1 with SMTP id
 6a1803df08f44-8db5e14e78dmr31824296d6.30.1781654387531; 
 Tue, 16 Jun 2026 16:59:47 -0700 (PDT)
X-Received: by 2002:a05:6214:55c4:b0:8be:7779:d1b1 with SMTP id
 6a1803df08f44-8db5e14e78dmr31823906d6.30.1781654387133; 
 Tue, 16 Jun 2026 16:59:47 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132178csm50191986d6.7.2026.06.16.16.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 16:59:46 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/5] hw/riscv/sifive_u.c: remove unneeded
 qemu_fdt_get_phandle() call
Date: Tue, 16 Jun 2026 20:59:35 -0300
Message-ID: <20260616235939.1358663-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kmQn1NU4qNpqLm73dWLPhMAfM2P8866e
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a31e374 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fewmvhpFTRUHsk0HV0MA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kmQn1NU4qNpqLm73dWLPhMAfM2P8866e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX0pHIFbx/PWsM
 6kig5axzjzqQPPBKIeHAeE124lf2QPr8plDqQB1ODuIE5yy/k/pBW4qyC+O6s4oVoVNYaYMrk/8
 VjbbCJF6/MRWPGpYfYV8DVgoasTk8v4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX8lrMibNBnM3r
 QO+vSdnmlI+50+9SDNvTbllqAN9XrIKPbTmQ1aLZOzxNM56PZBFPsCCbqlNeDyiQvCoTlSCYP+S
 zeY6HZG+UBpy8OcJ+2RX8Qd7HppPYKev0CmBvHAqoVfgY1y9Y/9FIPcKhYR+GBq5vrkKZ/pHuGx
 DltUb3mM6t4+QhZYaS2Cj+9nQWFp/T46yAzK0J1vLTXxSj/LFeFyxKnYBoiW0VlD0pOle7XAVyL
 9JefThaTU2mJVuK18pr1Rcs2gErpVCV7oFMF1Q/f5VIYbBFva98mDmPcq5s396VfqQJ07AOO3p0
 wkbcN/88ziDvvLuZtiltPq+gAvw7hVjxtx7v1nINRtdfTt9LANpyFhnyqZbAx5TKzqgQv+3QzcH
 dx2QaxnMdCu7sWcKSCFDwl8p6kGRKu/tVDpQ+so9veC0ZKlI/CndO8qKf8DRv9ggFqiC89Js7A2
 FUo06Jh03bqvjGAF//A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160242
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

create_fdt() has the following code sequence:

    plic_phandle = phandle++;
    (...)
    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
    plic_phandle = qemu_fdt_get_phandle(fdt, nodename);

What this is doing is assigning a value to plic_phandle, then use that
as phandle of "nodename", and then fetching the phandle of "nodename"
again in the same variable that already had the right phandle val.

Here's how it looks like in gdb:

Thread 1 "qemu-system-ris" hit Breakpoint 1, create_fdt
     (s=0xaaaaac162a30, memmap=0xaaaaab8f70c8 <sifive_u_memmap>,
      is_32_bit=false) at ../hw/riscv/sifive_u.c:199
199         plic_phandle = phandle++;
(gdb) n
200         cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
(gdb) p plic_phandle
$3 = 12
(gdb) c
Continuing.

Thread 1 "qemu-system-ris" hit Breakpoint 2, create_fdt
    (s=0xaaaaac162a30, memmap=0xaaaaab8f70c8 <sifive_u_memmap>,
     is_32_bit=false) at ../hw/riscv/sifive_u.c:232
232         plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
(gdb) n
233         g_free(cells);
(gdb) p plic_phandle
$4 = 12
(gdb)

Remove the extra qemu_fdt_get_phandle() call.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0c6e4204cb..fda9a09f06 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -229,7 +229,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
                           SIFIVE_U_PLIC_NUM_SOURCES - 1);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
-    plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
 
-- 
2.43.0


