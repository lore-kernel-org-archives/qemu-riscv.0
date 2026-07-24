Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B715C531FC
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 08:54:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnBfx-0005eA-Dr; Fri, 24 Jul 2026 04:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wnBfv-0005d0-0g
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 04:54:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wnBft-0005Pf-6G
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 04:54:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4lis82125423
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 08:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ykq5AD6M2X64uJDc6aZVThkU
 fOjiTnGbD710S5hX33U=; b=NKLmlNQ+xt25oKp6JV/XwwLu/388iuqrfNFDFzbP
 cuBPdbd5cPWaOBjc9aRthff7+XuA12xACdJML7aSjyXbVyZNzly3Obn4FIR/2YNn
 4zWkuzP9Gz3LGjig+cnEjIbyqX9YYv26HXKK4OfMLsT25LcQrBnKpFzHWFBJYtZc
 l3jk0GMvNlgfb9Y+2VvmzsUjpx4Lbemxap9dWCFs8pZTwQiTJz/vcUdYWqfvH4+X
 TMZyS1wyQ8wTLx/P8DO6bZmavRZyTasUAhwOAvtIiB+90amWIcWJmr4V2ziwbAD4
 RxGQct3bK8F6JUruWvtScgmkmYMpCWeTfUp7P7GVTRSUxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtw9n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 08:54:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso2952691cf.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784883270; x=1785488070; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ykq5AD6M2X64uJDc6aZVThkUfOjiTnGbD710S5hX33U=;
 b=RG/daliZW6treHPThXT84ih/d1ZMlD5PSyVi9M/Fby2ducdYbMZhQKhTahJCi2VHhh
 65b9AEN49zgK/oo3HdbQVgEhTN/Z65ROnERKM991asYPt/Q02sSsEyYFkfdAZPREJ8m6
 fzNom+IheJ2qNYgkqVy8xfWwN1wIYlgponCNnOQEdTGOE3lMx5md/ZFcIu5jxjQN6fUa
 xSvbQWSDGa62vcYz1EeAWEo7SsjHGxBs4mn6dRrzDoBm2a/5JesGaDwEwDhOlM+RlAM9
 hEoW3D09+kDRv8UI+RKVB0Mtz17Oa5u1nnApKK1IZhfcNyVov3FtbJAz4VV1wLGtN40W
 cfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784883270; x=1785488070;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ykq5AD6M2X64uJDc6aZVThkUfOjiTnGbD710S5hX33U=;
 b=pLRndmyv00xCleCwgHkc8xThTO5ERqdpTmHjDoA2FXcLSwD56odHwf9rQlT2U4d3hu
 6qM9DiCpeqa4f+5pVkH95toLMzoEbpfFASRtggZ/zk+DPNPnKNry+XD56i0QTmAZ6WHR
 Tm1Yz3evSpK8ILqk4rvW1hRGf1B8U2Z44muMEAtUKTvaRsWjt+4zHMMNxP5IumJfgJXo
 3D8NxeZzpCeHSfO4vyiGGHQw1W0ipiBp3iOp//2TJvUlNPSLAyshkOVKSL/kPEi/sKQK
 7i2k1+vnzG03vFYGD/zD4VJfHlhnUg4qSZVAC/KnPGqbFBDCaM9jfXM4EnUTVo6Yd0ym
 YvrA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rodp2x7Xl62NExFDlU4/O+DuPRyZfRxr/3nrMl414lfHtp1mVwSIU6AeOo1B68KkgpjfYVa98LSaQcc@nongnu.org
X-Gm-Message-State: AOJu0YwFLkte+Jb3aPukXUgsUoiD0jY+a6DgwLoQmvE8l4Hiqnq7p2v9
 lBbKTq98irbXG2X9JFb+12VeDXsI4/v0vZynvDy22tsPV8QWrCpXG+Z/wQ5NVB6yvnRlPcWqvWH
 36WmFg+ep5lAjO/lWUCjRMA3lw9k546HI8x2iPM/W5UHd8KZ/oQIH6ApZLQ==
X-Gm-Gg: AR+sD11INJ4nz7cIgyRI51u7jqk9Z7ckHCMPwo6cGHmLPqsAj5EOAhEiPZCL4O2M1uM
 0QBNJUzUoBpmphMKgEAzA8NZ/L9heMTrUuH/N/bYOYDxnDsscZN77wEb2asJ137v7ZpBhaDJC2O
 1CBjpHOBpTG0ECaj8aUmv7ZJF8vUq+u2D3hvgZpJcFz9swasUuz3lQXdj0hzqOwQz9GkkzCq85d
 R5sA7mmmUdMdyRe0siTPx2ehsB2KK2iedN0j98+ZXtYBPRugSAt8/QlgIaCQ/Ww0QollEXUmvLa
 vASIqxnAChrII9SF7zh0hoW7NGmq2eRhI0+SSL/AG2abaq9f0kOB/1adFfjA1vTxmK8vMcNIG2N
 cqi2E8DPyXLB0yBVvSpRH1vgzmQceGJ9ft7+k
X-Received: by 2002:ac8:5d4e:0:b0:50e:a1ab:114c with SMTP id
 d75a77b69052e-5283de30ae8mr62775861cf.32.1784883270044; 
 Fri, 24 Jul 2026 01:54:30 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:50e:a1ab:114c with SMTP id
 d75a77b69052e-5283de30ae8mr62775741cf.32.1784883269577; 
 Fri, 24 Jul 2026 01:54:29 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32ebc828sm334945166b.43.2026.07.24.01.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 01:54:28 -0700 (PDT)
Date: Fri, 24 Jul 2026 10:54:27 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Flavien Solt <flavien@nus.edu.sg>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: always send MRIF notice MSI
Message-ID: <oo4kyxpk4hsx3zy2bumsy5nchajxw7eyatnhogcri2d35ptlgi@3b72g675uvuo>
References: <KL1PR0601MB4874F12178F49F9BB8BEA7DF8DF92@KL1PR0601MB4874.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR0601MB4874F12178F49F9BB8BEA7DF8DF92@KL1PR0601MB4874.apcprd06.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfXyDhpMs57Qvy6
 fWXDux2v99WyR/gFNk9b4EszdFAjxiAy0/1C1SKzrPABCT9DSuSHMeeNIP+H928c+q7raW5+Tx4
 iiLtnqgq5MscMwqu+AZZm9cUnFeE/ubDEeQQqa7lVAIVWuszHQ0ORCbJQAktlmww7hI0Zn5qBvH
 DZDTAg7bIa1X/xXgWvqoxrxIRrvJ9h6TVwoL9n90/wJMmnxU/iqN5evK8oR6Cq8fSrGGDhjvq96
 X+FrGUpLi+3LHw40Rb2oHfrPeTJt2LsaV5fp/E6/Bq/uD8ZbgaKu86vi0vEX1U6D05dKNXTad7W
 lCXzcBDWwWGt5xA1a+ySNq17odWALCFuG3ZwzyCXho2rj+AhDgJgAJIWMQSy5tzz97RJ6dEzoY6
 r90QZa37pFo3kc0agY4v9bnUETLJ6mQqMihxnLGdoO46jsw/hK6Sl0RzAlltOHBdEZaj6gQQ2Rx
 o9gnDCRAdZ2RC+kMnCA==
X-Proofpoint-GUID: pMcxQtNwZJu1fWXcohXJ5KZtOMsKWfAT
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a632846 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=3NAPQOWDTWkrN7lJYGsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX+DoUSR6udgLF
 mg6YU7pW1xSD65dYAiXW30Dr+6bDQo6lAELpKajKqtSryhUEfpQIvt5ZPs4RSJppzJ2Y7qPkw2s
 iuDa+CBgwHDABaXB8vOJs6mOjunuS3U=
X-Proofpoint-ORIG-GUID: pMcxQtNwZJu1fWXcohXJ5KZtOMsKWfAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Tue, Jul 14, 2026 at 06:01:12AM +0000, Flavien Solt wrote:
> The AIA specification requires an IOMMU to send the configured notice MSI after storing an MSI to an MRIF even when the corresponding interrupt-enable bit is clear. The problem is that riscv_iommu_msi_write() currently reads the MRIF interrupt-enable doubleword and suppresses the notice MSI when the bit is zero.
> 
> This patch removes the enable-word read and always sends the notice MSI after updating the MRIF pending bit.

I'm not sure how these long lines will ultimately look when committed. I
suggest manually wrapping commit message lines.

> 
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Flavien Solt <flavien@nus.edu.sg>
> ---
> Tested with a deterministic qtest using qemu-system-riscv64.

Are these tests available somewhere?

> 
> After this patch we get:
>   enable=0: pending=0x20 notice=0x12d
>   enable=1: pending=0x20 notice=0x12d
> 
>  hw/riscv/riscv-iommu.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index f6865d1..9627cab 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -788,20 +788,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
>          goto err;
>      }
> 
> -    /* Get MRIF enable bits */
> -    addr = addr + sizeof(intn);
> -    res = dma_memory_read(s->target_as, addr, &intn, sizeof(intn), attrs);
> -    if (res != MEMTX_OK) {
> -        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
> -        goto err;
> -    }
> -
> -    if (!(intn & data)) {
> -        /* notification disabled, MRIF update completed. */
> -        return MEMTX_OK;
> -    }
> -
> -    /* Send notification message */

We should keep this comment.

>      addr = PPN_PHYS(get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NPPN));
>      n190 = get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NID) |
>            (get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NID_MSB) << 10);
> 
> base-commit: 499039798cdad7d86b787fec0eaf1da4151c0f05
> --
> 2.54.0
>

Besides the line wrapping and the unnecessary removal of a comment,
this looks good.

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

