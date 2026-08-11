Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4E9C5B56A
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrJ1-0006y3-Ge; Tue, 11 Aug 2026 14:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrIw-0006vS-Lf
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrIt-0002OX-VX
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:26 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BHsXnR1919854
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6LahR4PsoDsUon8zyy/2/dQlNlZenYbz4hKFiVvKYPs=; b=U3dy943jr3Pgm/E8
 OFEojGQ40w2tepuviwnFCOR6ZhOondu3iD8WOsY0jDAdHUiHSNzrCIFPUhURw0RB
 GH6TwooSJMwjj5h+aFRebD1pee0XAl46V8LBHVhcsBWaRhcIP4u08ISVNMJ1+GdB
 yelCy6ifuSF8SBaLdtGvwgNTURlGR1MX2g44s6QSA8W9msEN5jSHzilD4KLm7Yyc
 3kqmqJlgivlgvUicoYd8I1llYiJFSf6LVY0W0A3kPlPhcJqzYgkDynHRYU6brRSq
 zOWClrAf0O1hgIoPHbgR4bDJlwstsymxRCejnooKXhHMa+IOfmmQCGqvN9UMBp+v
 MOlCAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5g5gt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c20762d21so3434191cf.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473261; x=1787078061; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6LahR4PsoDsUon8zyy/2/dQlNlZenYbz4hKFiVvKYPs=;
 b=CaizIrdF+l9dGjGq7ErL3TGeMY7ybeLhiN8gRvGfvJ5xJxr9uy5C81GTrgf9bELPdt
 Hy0HR0iz2+MTyWH4pbtEWBZkSJEB0HoZfuiQBETElOQSE6AoCgRJEn4T8P+1ev0dWoYF
 4qnlws6DRjvqwSLAOLm8zVXU5EZWfQxpCi1LGVsD/uzQvGsg1UZvaxM6eH25EFXw51FO
 CeV/QB2GhhTrPWvA2fUy1x+T9Whju9tBoxoLI6rUJAxEJnuuPTRYyj8PuYqaXAiz9/BO
 tgiRbh0wcEMVZXErsk3/2HhhAlknu/+JGO76mbjE2YC1mGANMXNLEZRgArqcxfJ25YAv
 i5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473261; x=1787078061;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6LahR4PsoDsUon8zyy/2/dQlNlZenYbz4hKFiVvKYPs=;
 b=MyVIzgzn2PIGAhK7tBS2RuG6d3ZwHZYQDj1epU4+3ub4krw4tfAj4j9qOaIIhDKtFN
 z2MDmrFXFStSQ7mJ/2YN7kKchB4+AD4OkVyh5+fmZs/Myjqdl5MAoUpDy2gxchmEAaFz
 1kGnp4R0vwILB0GhO8Do3NEFzd0PVHAsLAAuThZYMjpYVYTM7hbqIgq606qyO3lCcsgo
 t2R3hDPiTY5dXs9GeVkGnpu84pgCsIh2CcXbdmf9alcnEtKbXyHtxT86t1TkoIvi6X0B
 f7XLBW0vqUFATaEX47GL9ZzimdeW+D30DP/XnFRDEiq7gXtY81cJw7AsltMxqI1V0jnp
 KTEg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqplp2a9iVEE6BtaOARP0oZruDbSXWeiWLu9xx1Ha53jpF6s5rnEbiSCLc72PUFEtfoQ01vG3V0rFRY@nongnu.org
X-Gm-Message-State: AOJu0YxZNGMnjTjDijBSz0rvxY/lF0/81inXMxZKxkd9yqFbzGMy38PX
 Aw7oQm6zv8DwtaNIU2l3TQxfqUe3Q8wPZsGRS0eJJ5jh2hUqK17e89KKhTJkXU9eius5bZHxAUD
 lZ+gr80YtCLYD3JgjtO1ZgN7S9BHFic2VU3YhqWWCOl8o+mAJdeLswI5ddg==
X-Gm-Gg: AR+sD1092Fvl7krAQJU01Jz0f9UZ6PN/qm9uDKLiYzgtSEsapoRqI4hfSbS/7/VcOoz
 /44ZK5vPSA714OaiOD0jHsyWnNQizhGETgMnQssn9SLn8eWoH3h7TSz20ZJYkpydoaCT2SFBAoa
 35zK6p1Y7Oqj9rxEU8z2YSclx+IhT/vdmndcOUXusLLJTvFMSWbxqUFfrvNgJDzruhQmxtYSExp
 gm+0JTANFkC6Bj26MtMlqPWhSX+7HDRBV45ndzqRfmARWfTyqn3u3vMSniC1IMxWoqR7HmKSQvg
 eOoG+caDSrwELV7dy0DR5JUVoAObS3GUakZma+qiyuUrIdVu+fzz0v3pKaT4TYqViD7qBVieUWL
 UblsHodPb4seyt0r2r7neI2BFEbpAwg4yPVgafOgvfA==
X-Received: by 2002:a05:622a:1b02:b0:51b:fc67:c738 with SMTP id
 d75a77b69052e-52d5866ceacmr52372121cf.29.1786473261116; 
 Tue, 11 Aug 2026 11:34:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1b02:b0:51b:fc67:c738 with SMTP id
 d75a77b69052e-52d5866ceacmr52371671cf.29.1786473260652; 
 Tue, 11 Aug 2026 11:34:20 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5c5fsm390300f8f.3.2026.08.11.11.34.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/8] hw/cpu: Correct CPU_GET_CLASS() comment
Date: Tue, 11 Aug 2026 20:34:03 +0200
Message-ID: <20260811183410.22428-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXzgftY+3Rf0hT
 LByBBTFBr+LuYU+RYdTFFE/PjFe/twlZZCWyFjD4aVvQedekjLe4rXvLeJt2fEodXr9UUBtO8AO
 qWblzcC+x8jk2OeTeFSzqeW2LGgQwpo=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7b6b2e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uwI2kk57myJ7FXLdqBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nEs6OFKS4CYjIyCHRx0g06OeSucLAg5q
X-Proofpoint-ORIG-GUID: nEs6OFKS4CYjIyCHRx0g06OeSucLAg5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX3Okf/z++RgGw
 Rz9PXxS6GN6bGC9zN2aYn38986cThHwdRDZK6MAAJOmgI44qbgi692Wek1nrOf3234X/dbMb7PG
 m2ccjcNfEDOSoCtcFjiMaK1rlA4o9YYnw+OHcdv3cl5ibGf4/LAJQcypbP4fsa+3kncWVRbi38B
 k5b9UuYR9nhmF+Vm8mG+xZV2modne5Ykm8fYCZ7G6/tnE45Qp5jSkXdXxABeU2pR42cGHqZLSX5
 GreVskXhIEJUynTHfkq1dhp/1MQ7UVFScDzCGELDPy9IoR9bsbIYIUhhu90ifaJRxZHTUvyOrVp
 E8q4J5so7D3OPBinLE2OBkrNwLB3PoYEjGeogzN2S3ZNOwDuzNMvQwbobzhsT8u+7W2r7d9U4/9
 o8+MW0/TJ5QClqGx1QboFbyffIS9atByDdB4Q/gXqSPPnroIzsmyekbQFpv++YBNqauRH1CBeQ7
 h2r3d1UXAyv2qIMg1Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110155
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

commit 0e86d7a71e8 ("cpus: Cache CPUClass early in instance_init()
handler") renamed cpu_exec_realizefn() -> cpu_common_initfn();
update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b54035fb13b..c5064a5449b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -60,7 +60,7 @@ typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
  * expensive given the eventual call to
  * object_class_dynamic_cast_assert(). Because of this the CPUState
  * has a cached value for the class in cs->cc which is set up in
- * cpu_exec_realizefn() for use in hot code paths.
+ * cpu_common_initfn() for use in hot code paths.
  */
 typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
-- 
2.53.0


