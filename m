Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAA0C56205
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 12:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrwzf-0005Ya-TR; Thu, 06 Aug 2026 08:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrwzd-0005YJ-Uq
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 08:14:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrwzb-00031h-Cb
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 08:14:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6769nf441534014
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 12:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ODkUdiTKb4BmzdXXVtvmEqRisHLVsIN1rHRWrqwSOAw=; b=omBoVHVbcnyTfY1T
 UXuWBDr1e/1yx3wf65wGP4VN34O4ijii7HYc3wG1yvwzZd5sk8cv1fgvEavL/UNt
 FzyIBmui0JoJvFd6uKq6RETCyx4iMTnVoDKyH7CVRKhx+RInSlKjm8hbBla7bVP2
 GeqOLZNh9b66l1vf6404ZDSFRSJob5WJU9N+DVT70Njydk8d1l/y4rXNpWPQ8qOa
 P+5nxrzcEe4kt5pqUGrGUqQ7WYQ9qzOAr/iTM1JlhLjz0sFZxmrf1jvb5pC6vjiM
 hCstx5CgCo9RQU4LVu6iwRfIqRluT0cH+vPnW/KuaGEnHAMtLI2Vs9oiaP59nK+l
 csDBsQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8psdwv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 12:14:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9080b7b2f2bso21312066d6.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786018473; x=1786623273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ODkUdiTKb4BmzdXXVtvmEqRisHLVsIN1rHRWrqwSOAw=;
 b=TZXXquu7L6kNdeI6C98jQjPDHX3NxxMV0Mhp275S38u4fMik+u74B/cexUKWgPk0Or
 FQi7N5XZiBLjPA5i7T10cSwr130H2DN+rDed71SPtipBr06ZCNYNfQdM7Wc6iPIcBSZA
 p8YkntKxATxTcTL8kg0dFdvcnWhtLpRU0Elq8D9u3lPyvi+Ss7hHjNeN33D6bR2Lu/Qf
 fnn3eK800xePxPsgfNpXUS00xFamqG6ShjePHn2T+qlHWRRqcOQq2+Uxq9sfZCn+0VEK
 uDdP1hgNTkwaXj3//1JYfD2OegwHSTwqAEL/ToTg9VxsDr7YdIjHyhu7QTx0IlYRIDep
 M+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786018473; x=1786623273;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ODkUdiTKb4BmzdXXVtvmEqRisHLVsIN1rHRWrqwSOAw=;
 b=h/0ivzdAHxcp9ygLpKgYEF63ScHZyuQOT2ezGe8Na0aDWhG61AwgaRmqgRVAyh8NZq
 xfHkgBSgZZ7tOKN+5UM34mGYxBIYVjem8x1MQ9Zyx0FyPhU46GjIXl7rkE8EEjwVPh9C
 yTOhgBxOSXitwtnui6PCAsuFTbPiI4h8QLJAuQllFO21K5Nqz5gj/3vIvJXgrxV/dH3q
 pwlmSpl5zHjo7xzcXScJo1lddf87o1bM/f+yIJfptTOpy1txULK5vdt4N39MuprNQ6Mp
 YeqmhQjT0RMuvP8cedN1bxl5yi5EXBSb5yNr1ge46H9hQWHrFHXK0s2cT73AJgvRokxw
 XJkQ==
X-Gm-Message-State: AOJu0Ywm6liq+WuAiG6/2duoxR6sy/zXDhsOgoN8NPsABVRzo5ZMgKSL
 O6R9rdJqMXRNsFe3UgYR5QoV06LwNP315n0qKLcgrY9vyOp3pykR7ND3oZtUM+nYX66TVNIdU1O
 zkq5UzdML8RjZYZ0t4c+QkdI8TwPhudj5NoZSmL43dzdQC6X2fCPZ06kceA==
X-Gm-Gg: AR+sD10x+nXC+kzedgsglRGrSG5q10BCCCAt2wUdM/aBpOAITw0BAVIQXVwvL3lhp4h
 vlu2zYDI8Uk4VB+fA/9nVHiJoH+NkHpvnZxT5CGyjQ16EuXr0zEOdWzS45S91FqVTtOAIi4TKLk
 RxXdsGKslEvqJz+iqS24gNiwgdXhykm2qkuW/+pA/m9/ME2V9KkNGIxAGu4orSxdb4KC6q2RyvK
 twte7PBKOb4QUIHBJLOpDoreDRXd+p3zDTCH+ZdGvbyDExaHlyurR6aSbW/b8TrBZK39MSTbp0C
 3/Dol9dpHBmaPN7PBuoHesCqv3RThah5sK9FAqrXYPu6zR+QSXMFJVST9+526SXyIhAnO5J8Z0q
 Jr1hrYVzZXMtWEIzQnm56m223vQcVyQL9LTQ=
X-Received: by 2002:a05:6214:e8d:b0:907:5c68:54d1 with SMTP id
 6a1803df08f44-9088126d26dmr162591106d6.18.1786018473042; 
 Thu, 06 Aug 2026 05:14:33 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:907:5c68:54d1 with SMTP id
 6a1803df08f44-9088126d26dmr162590436d6.18.1786018472549; 
 Thu, 06 Aug 2026 05:14:32 -0700 (PDT)
Received: from [192.168.15.43] ([179.93.128.106])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9087ff9de67sm56271926d6.8.2026.08.06.05.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 05:14:31 -0700 (PDT)
Message-ID: <c180b3d8-3a1a-42e7-9f58-4b3d4b95f2c8@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 09:14:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] tests/qtest: add test for K230 decomp gzip
To: Tao Ding <dingtao0430@163.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 farosas@suse.de, lvivier@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 caojunze424@gmail.com
References: <20260727155702.36484-1-dingtao0430@163.com>
 <20260727155702.36484-7-dingtao0430@163.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727155702.36484-7-dingtao0430@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX7LjeoPiXHEJq
 zc9Kac+dPVZw4Uw98clUtpQXr+gHY8pajrUbtMbGENEBGVAjE97tbAerLRSfblWpiDdEU3F7bch
 XA8gyCWU/LasQQmT0If7YK8pMTLYB/s=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a747aa9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=j+AuKCDe0+4C9p6jaetDeQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=3elD0-mlz-axnaUqbxkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1JkIYpRFIs4emK4LljOEEMBh3w0Hu5xB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX2rNXwsv5dS/C
 74Y9Emx0/xYO2/YqHKu/jWpGOpyOMtp8cG76oQ5CAKoEGaKaRR4JJZ9850ZOUHEqjkU9s8SJ5zr
 K69mHLyIk9cH+pqkyvqZxt74gTFMkue0dg+/o69+QmAIdaQc5o1totDTyysK/BLtxotnWBvHQ5m
 Hl1QILkfX3E+tOQGAB0na4OEe91cWic8PcbsE2u/kZyEmQpt4AZZfU2I7852NHDffAO1jYs7GyL
 bQBbMCqP3KIE5Iuxx5I0THImkl9jxWOik/vPmpA2ZeNQc75Kenq9URJYCI6/vRQAddH9fg6ABm4
 ds3c45OzMt7dPGI21NnENOTSbHHSD/xjGrHv9xJbLMNxYkpvWNcmwZGg17xiZ22PygHAFBEfO3o
 o0BTmj17YrypZqU3V7YTWF2irdGrvrbNEZK37P7XSIwEHtdT59gY7K+kZBYJn6Rhce+f8bGOSGl
 OvCgFXI2l4+qlHy7iKg==
X-Proofpoint-ORIG-GUID: 1JkIYpRFIs4emK4LljOEEMBh3w0Hu5xB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060096
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/27/2026 12:57 PM, Tao Ding wrote:
> This commit adds test cases for Decomp_gzip.
> A compressed data segment has been pre-set, configure GSDMA and decomp_gzip.
> Compare the decompressed data with the original data
> 
> Update MAINTAINERS for this test.
> 
> Run this qtest:
>      $ mkdir build && cd build && ../configure --target-list="riscv64-softmmu"
>      $ QTEST_QEMU_BINARY=./qemu-system-riscv64   tests/qtest/k230-decomp-gzip-test
> 
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> In patchv1, the reviewer pointed out issues with the data.
> This is a bug and decomp_gzip only supports dynamic Huffman format.
> In this commit, reused the dynamic Huffman method to generate compressed data.
> 
>   MAINTAINERS                         |   1 +
>   tests/qtest/k230-decomp-gzip-test.c | 200 ++++++++++++++++++++++++++++
>   tests/qtest/meson.build             |   2 +-
>   3 files changed, 202 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/k230-decomp-gzip-test.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c260199142..dcfcc51144 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1838,6 +1838,7 @@ F: include/hw/misc/k230_decomp_gzip.h
>   F: tests/functional/riscv64/test_k230.py
>   F: tests/qtest/k230-wdt-test.c
>   F: tests/qtest/k230-gsdma-test.c
> +F: tests/qtest/k230-decomp-gzip-test.c
>   
>   RX Machines
>   -----------
> diff --git a/tests/qtest/k230-decomp-gzip-test.c b/tests/qtest/k230-decomp-gzip-test.c
> new file mode 100644
> index 0000000000..e80113fd28
> --- /dev/null
> +++ b/tests/qtest/k230-decomp-gzip-test.c
> @@ -0,0 +1,200 @@
> +/*
> + * QTest testcase for K230 GZIP decompression engine
> + *
> + * Copyright (c) 2026 Tao Ding <dingtao0430@163.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "libqtest.h"
> +#include "hw/dma/k230_gsdma.h"
> +#include "hw/misc/k230_decomp_gzip.h"
> +
> +#define K230_DECOMP_GZIP_BASE 0x80808000
> +#define K230_GSDMA_BASE       0x80800000
> +#define K230_SRAM_BASE        0x80200000
> +#define TEST_LLT_ADDR0        0x01000000
> +#define TEST_LLT_ADDR1        0x01000040
> +#define TEST_SRC_ADDR         0x01100000
> +#define TEST_DST_ADDR         0x01200000
> +
> +#define TEST_PAYLOAD_LEN          (sizeof(test_payload) - 1)
> +
> +static inline uint64_t gzip_reg(hwaddr off)
> +{
> +    return K230_DECOMP_GZIP_BASE + off;
> +}
> +
> +static inline uint64_t gsdma_reg(hwaddr off)
> +{
> +    return K230_GSDMA_BASE + off;
> +}
> +
> +static inline uint64_t gsdma_ch_reg(unsigned int ch, hwaddr off)
> +{
> +    return K230_GSDMA_BASE + K230_GSDMA_CH_BASE +
> +           ch * K230_GSDMA_CH_STRIDE + off;
> +}
> +
> +static inline hwaddr k230_sram_addr(hwaddr off)
> +{
> +    return K230_SRAM_BASE + off;
> +}
> +
> +static inline hwaddr k230_sram_input_addr(unsigned int slot)
> +{
> +    return k230_sram_addr(K230_DECOMP_GZIP_SRAM_IN_BASE +
> +                          slot * K230_DECOMP_GZIP_BLOCK_SIZE);
> +}
> +
> +/*
> + * test_gzip_data was generated by compressing test_payload in gzip format
> + * using Dynamic Huffman coding. The compression method byte in the gzip
> + * header was then changed from the standard value 0x08 to the K230-specific
> + * value 0x09.
> + */
> +static const uint8_t test_gzip_data[] = {
> +    0x1f, 0x8b, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x04, 0x03, 0x05, 0xc1, 0xb1, 0x0d, 0x00, 0x20,
> +    0x08, 0x04, 0xc0, 0x9e, 0x29, 0x7e, 0x04, 0x23,
> +    0x63, 0x38, 0x85, 0x05, 0x21, 0x14, 0x10, 0x23,
> +    0x5f, 0x39, 0xbd, 0x77, 0x6b, 0xea, 0x80, 0xbf,
> +    0x38, 0x68, 0x5e, 0xdb, 0x19, 0xe5, 0xa0, 0x35,
> +    0x65, 0x4d, 0x1d, 0xf0, 0x17, 0x07, 0xcd, 0x6b,
> +    0x3b, 0xa3, 0x1c, 0xb4, 0xa6, 0xac, 0xa9, 0x03,
> +    0xfe, 0xe2, 0xa0, 0x79, 0x6d, 0x67, 0x94, 0x83,
> +    0xd6, 0x94, 0x35, 0x75, 0xc0, 0x5f, 0x1c, 0x34,
> +    0xaf, 0xed, 0x8c, 0x72, 0xd0, 0x9a, 0xb2, 0xa6,
> +    0x0e, 0xf8, 0x8b, 0x83, 0xe6, 0xb5, 0x9d, 0x51,
> +    0x0e, 0x5a, 0x53, 0xd6, 0xd4, 0x01, 0x7f, 0x71,
> +    0xd0, 0xbc, 0xb6, 0x33, 0xca, 0x41, 0x6b, 0xca,
> +    0x9a, 0x3a, 0xe0, 0x2f, 0x0e, 0x9a, 0xd7, 0x76,
> +    0x46, 0x39, 0x68, 0x4d, 0x59, 0x53, 0x07, 0xfc,
> +    0xc5, 0x41, 0xf3, 0xda, 0xce, 0x28, 0x07, 0xad,
> +    0x29, 0x1f, 0xdb, 0x9d, 0xbc, 0xdd, 0xc8, 0x00,
> +    0x00, 0x00,
> +};
> +
> +static const uint8_t test_payload[] =
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n"
> +    "K230 gzip streaming test\n";
> +
> +static void write_sdma_llt_node(QTestState *qts, hwaddr addr, uint32_t src,
> +                                uint32_t dst, uint32_t len, uint32_t next)
> +{
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, cfg), 0);
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, src_addr), src);
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, line_size), len);
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, line_cfg), 0x1);
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, dst_addr), dst);
> +    qtest_writel(qts, addr + offsetof(K230GSDMALLT, next_llt_addr), next);
> +}
> +
> +static void test_reset_and_rw(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_DECOMP_START)),
> +                    ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_SRC_SIZE)),
> +                    ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_OUT_SIZE)),
> +                    ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_DECOMP_STAT)),
> +                    ==, 0);
> +
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_DECOMP_START),
> +                 K230_DECOMP_GZIP_START);
> +
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_SRC_SIZE), 0xffffffff);
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_SRC_SIZE)),
> +                    ==, 0xffffffff);
> +
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_OUT_SIZE), 0x12345678);
> +    g_assert_cmphex(qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_OUT_SIZE)),
> +                    ==, 0x12345678);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_gsdma_handshake_flow(void)
> +{
> +    QTestState *qts = qtest_init("-machine k230");
> +    uint32_t stat;
> +    uint8_t output[TEST_PAYLOAD_LEN];
> +
> +    qtest_memwrite(qts, TEST_SRC_ADDR, test_gzip_data, sizeof(test_gzip_data));
> +    write_sdma_llt_node(qts, TEST_LLT_ADDR0, TEST_SRC_ADDR,
> +                        k230_sram_input_addr(0),
> +                        sizeof(test_gzip_data), 0);
> +    write_sdma_llt_node(qts, TEST_LLT_ADDR1,
> +                        k230_sram_addr(K230_DECOMP_GZIP_SRAM_OUT_BASE),
> +                        TEST_DST_ADDR, TEST_PAYLOAD_LEN, 0);
> +
> +    qtest_writel(qts, gsdma_reg(K230_GSDMA_DMA_CH_EN), BIT(0) | BIT(1));
> +    qtest_writel(qts, gsdma_ch_reg(0, K230_GSDMA_CH_CFG),
> +                 K230_GSDMA_CH0_CFG_DECOMP_CTRL_EN);
> +    qtest_writel(qts, gsdma_ch_reg(1, K230_GSDMA_CH_CFG), 0);
> +    qtest_writel(qts, gsdma_ch_reg(0, K230_GSDMA_CH_LLT_SADDR), TEST_LLT_ADDR0);
> +    qtest_writel(qts, gsdma_ch_reg(1, K230_GSDMA_CH_LLT_SADDR), TEST_LLT_ADDR1);
> +    qtest_writel(qts, gsdma_ch_reg(0, K230_GSDMA_CH_CTL), K230_GSDMA_CTL_START);
> +    qtest_writel(qts, gsdma_ch_reg(1, K230_GSDMA_CH_CTL), K230_GSDMA_CTL_START);
> +
> +    g_assert_cmphex(qtest_readl(qts, gsdma_reg(K230_GSDMA_DMA_CH_EN)),
> +                    ==, BIT(0) | BIT(1));
> +    g_assert_cmphex(qtest_readl(qts, gsdma_ch_reg(0, K230_GSDMA_CH_CFG)) &
> +                    K230_GSDMA_CH0_CFG_DECOMP_CTRL_EN,
> +                    ==, K230_GSDMA_CH0_CFG_DECOMP_CTRL_EN);
> +    g_assert_cmphex(qtest_readl(qts, gsdma_ch_reg(0, K230_GSDMA_CH_LLT_SADDR)),
> +                    ==, TEST_LLT_ADDR0);
> +    g_assert_cmphex(qtest_readl(qts, gsdma_ch_reg(1, K230_GSDMA_CH_LLT_SADDR)),
> +                    ==, TEST_LLT_ADDR1);
> +
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_SRC_SIZE),
> +                 K230_DECOMP_GZIP_CTRL_EN | sizeof(test_gzip_data));
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_GZIP_OUT_SIZE),
> +                 TEST_PAYLOAD_LEN);
> +    qtest_writel(qts, gzip_reg(K230_DECOMP_GZIP_DECOMP_START),
> +                 K230_DECOMP_GZIP_START);
> +
> +    stat = qtest_readl(qts, gzip_reg(K230_DECOMP_GZIP_DECOMP_STAT));
> +    g_assert_cmphex(stat & K230_DECOMP_GZIP_STAT_CRC_OK, ==,
> +                    K230_DECOMP_GZIP_STAT_CRC_OK);
> +
> +    g_assert_cmphex(qtest_readl(qts,
> +                                gsdma_ch_reg(0, K230_GSDMA_CH_CURRENT_LLT)),
> +                    ==, TEST_LLT_ADDR0);
> +    g_assert_cmphex(qtest_readl(qts,
> +                                gsdma_ch_reg(1, K230_GSDMA_CH_CURRENT_LLT)),
> +                    ==, TEST_LLT_ADDR1);
> +
> +    stat = qtest_readl(qts, gsdma_reg(K230_GSDMA_DMA_INT_STAT));
> +    g_assert_cmphex(stat & K230_GSDMA_SDMA_DONE_INT(0), ==,
> +                    K230_GSDMA_SDMA_DONE_INT(0));
> +    g_assert_cmphex(stat & K230_GSDMA_SDMA_DONE_INT(1), ==,
> +                    K230_GSDMA_SDMA_DONE_INT(1));
> +
> +    qtest_memread(qts, TEST_DST_ADDR, output, sizeof(output));
> +    g_assert_cmpmem(output, sizeof(output), test_payload, TEST_PAYLOAD_LEN);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/k230-decomp-gzip/reset-and-rw", test_reset_and_rw);
> +    qtest_add_func("/k230-decomp-gzip/gsdma-handshake-flow",
> +                   test_gsdma_handshake_flow);
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 1b13a777c9..7da12421af 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -297,7 +297,7 @@ qtests_riscv64 = ['riscv-csr-test'] + \
>     (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
>      config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
>      ['iommu-riscv-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test', 'k230-gsdma-test'] : [])
> +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test', 'k230-gsdma-test', 'k230-decomp-gzip-test'] : [])
>   
>   qtests_hexagon = ['boot-serial-test']
>   


