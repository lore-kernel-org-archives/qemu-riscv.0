Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873FBCD98E4
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:38:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE44-0002Mx-E6; Mon, 15 Jun 2026 16:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE42-0002ME-NT
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:37:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE40-00026n-Br
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:37:46 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIxDgC844401
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=04I9RWgZccE
 RuEgf2h0Q8DCPFbbYni8O78bwBXOtlT0=; b=dKwLEA9whl1Qtedge5oIkhKSZuN
 1Cr+9pqRnG6jcHLg8a5GqaVUoRax/YlvF9IsyBTkP5zJfYuvod92Jd2s41Xp/V60
 lE7vM4PynZQ9U9EcKlEa/mLgadKQxZ6wK3gk4H4IfYYbs/GGm8FGQ2QZebzeBWMS
 Kfi+aIiIet4SEpEm2cACEuVfrXsspYKjAsyghTogMSzqz0Yh0xOTnE+TeeSt96oq
 NJFgZZ6eszS1BSwqcHzhAT3X/xF7tzJYJcKLu/ZwisBMXoEVcFp6KV9PkT8Y/cKo
 fk1E/FlI1p6rye7Guwk4w0RUj5lfKEygD6OdEDgY2WxL4xJsTsm6lLkqrAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter02v80-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9158e75cbc0so570477485a.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555862; x=1782160662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04I9RWgZccERuEgf2h0Q8DCPFbbYni8O78bwBXOtlT0=;
 b=BdF8d2eNhmvHB0ooUZWP+Z6IRhNBPZap6/4Tf8BURWyOmwEqFBUR7ZG7xE/qhI13qh
 PZesC6vPcYWfkj1FJVXOPfc11UKn+LepLUJOo0dp3JvihPaZUJW+vCsLKX6jES4DWCk7
 MbYGdvh6M05432nOnBm3ZU48jSrGy+Izknl6c8gj5sgGckxuaaMfeHKsBTBEF5vh8UjE
 NJxnlC7HNrMQjMFUgLSfsCqHhSQw1jxT3ZXFNSJOLI9Vbl17Y1IMVkWSjAdduvrkHPSz
 XPEe/vpUsH2sAL6QNPkXMxkthZq3NK/Dg/UA2ieZm+qLRFn4bmHuoPsvDa57bFWr5Vvq
 M+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555862; x=1782160662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=04I9RWgZccERuEgf2h0Q8DCPFbbYni8O78bwBXOtlT0=;
 b=tPrIIFNNJqtiGQV5nR1zqXGohYjPiIKxKTyc94zum8tY7nN+QfwSQLRQ4W/vIWIA9x
 4TShRZ6XsLB6TxdYAjfDJKRujX34PpZODxO0+SdKCeWZzZDMdKCiKupYI2LlkcCtdeDt
 4/c59PFKc+QFPegBwBT5l2hQUc50STO1mXRou95T6CupeYeLtkKg+guvylannmJzgWhD
 lJYkIHfQX/p9itrDWTRDncE/VYMrwx/djTjZ/oSjh5wN6k/NdbJMjYa8r9yxNhm86Dhv
 Lhcz7tVW5g5qGY8iBCv7/kAujqNN7rS4Ain4zN/Wiw4QgfKa+XLAR/dx+hgOKA+d7QmF
 V+tw==
X-Gm-Message-State: AOJu0YymbV8vObOmN3WyWVvr8Y2i/rf4bYvXjgapVKxaUV/LaKFz0LU8
 eA4G8zkJzLOY7Y3meSTf0mHH11jchfSEKTRiEaOUy6Jqglk7KAOkZ02mW6gX9Vwvmd/ukWKOwzU
 XsAPhLMGcmyhpkp7yRSWetvPmT7Sh7muwOQ6QEq5a6Y0iirbWGj0Qts/ZrA==
X-Gm-Gg: Acq92OHnmw1zN5WfgXmOYjttO8Q7X1QTyGFP1JKPLyrpcISwEoWZc1t/PtZ2fZbTDkR
 O5BP9/Qa0uvu2MId4j4XXGEN0aqfUFf6VwWHp+QbxAQuqEjCP3R5xlU9kgWTIjVfBCaSG/4mCOx
 h2TxTEM85uXqOEdAxtQ219z6ufO6nTjhJYBMX3r9NSROSVd8+POvAmmRFkOP9Lig93o+HUsVS1P
 doFfC149DCnEiEuFXNeRZxSHmS6V9axCMdvjQVfDJWa6SN9zuefHc2hY9JLbtibzqAYVVpbt/PI
 ArUt2cSIieECGxZMu4BWi9BpAsmBK6UWMDbfwHFIcLYiDz1K5qu+o2QX3uydivWerHTohCfc9ct
 BpFodr09weEzw7XiPSh6QfSahQ3hSd64hTJXRw5YbVlQgluvra2c2fMzNYjc=
X-Received: by 2002:a05:620a:27d2:b0:915:d443:e6db with SMTP id
 af79cd13be357-9161bc2337fmr2313821985a.20.1781555862024; 
 Mon, 15 Jun 2026 13:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:27d2:b0:915:d443:e6db with SMTP id
 af79cd13be357-9161bc2337fmr2313818585a.20.1781555861564; 
 Mon, 15 Jun 2026 13:37:41 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:37:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 01/13] hw/riscv/sifive_u.c: add a FDT phandle to cpu-intc
Date: Mon, 15 Jun 2026 17:37:21 -0300
Message-ID: <20260615203734.954428-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dqsF5FesaC69UX5gz5a3B3iNPBIJg0vF
X-Proofpoint-GUID: dqsF5FesaC69UX5gz5a3B3iNPBIJg0vF
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a306297 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=G410GlaaS0drJ4fCzjAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfX1QmtJrEr0I6A
 MVz+wjCmBAlbBPqhlZ2TEibReW45ZJ8peFDdbgOt6OwwNZl/ZQdRGWKCQdtKnxhoVpHawNKNoM7
 5G1eGwSez6YbquZi5IjbmjXAZJBmEe83h2ifedGR5V16O1hPsh7lDSfChhSIcUtCdG83VwtrsmJ
 iUcQW7tPrDZ5avjw17yrb9yUoLghUjzQQmSxeT2go4C8BtVInJVl6/X6G04m3XTEkQJP42w6VLa
 gL0ObWp2REJnUoZHm2sKalMDZia+e/Hb1IErpkfhsrnY/LrLKKiSWcsCoK+yyePZw98enxEHEkc
 +PhRpKRETq8rSKvCx+1ytWjh8m4P+chQPiUnauyo0s3SGvx2tF1xrAh+1mmABMbQo4kN/HcbOR7
 PAxl0sC0fDtZVf1xj2v9mXAbmPMU/nt8hBWiWkrOaeZYHDnoGtyBeyECEme+gDZL8WVfbdYsBpI
 WNnXM+++6IUteZ0gFwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfX50GVaiwEWalA
 TbjbgHxN9iPk0d9JjBuJ2Jy1qSnzjcE84xHP43r4jf1pBSvxcp1HCarz8Ebrzz+ggbJOrS17JYa
 1kUBxEfYf2OJixqAs7zpMcLjxxCTxHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150218
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We're assigning a 'cpu_phandle' phandle to the cpu-intc phandle field.
Make it more in line with the other boards by assigning both a
cpu_phandle and a intc phandle.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6a637e3b86..3abbd6c823 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -187,8 +187,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
         qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
+        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
+
         qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
+        qemu_fdt_setprop_cell(fdt, intc, "phandle", phandle++);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
-- 
2.43.0


