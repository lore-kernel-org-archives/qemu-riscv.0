Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A63C79F9F
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 15:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4hAM-0001bx-07; Thu, 10 Sep 2026 11:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x4hAD-0001bn-Iy
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 11:58:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x4hAB-0002lG-TF
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 11:58:13 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68AF4YPW1186628
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 15:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OPTjfya0LFf2qCHyAL0SFvTX
 Ep2n1zeZrZKQw3Z5r+s=; b=VeC3zPMfncneABeCnfZQt5S332Mqo+MUg8iNdivJ
 jJPS4tqXhKyQ2Otu27ZvmGNwZSZ/yjIoWVL7jj1Ls3yTHOB8uCL5/zIpZy0XHhQQ
 E1ukMbBRL0nptOWxn5qWqNDDHBHMZae77VIVpUmoZRBkSPs7zd3Oc/fGaHTHWE1T
 MFKwCCCoFKfqb4kyMYIhYQeY/HgEEdsmP9C+91v6YrAF3vEMAtQByrHFVx/XGBtF
 w1TdRi6xDl01x4IFmdpqZtiHfSBdywy64xkRk0rKTeDWNlFo4An273iNmUKK/Zfs
 U6Koe8GyfUu5cPULMWHHuLYa1eqKOAZn2EM04zXqJ6rdtw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkraka7sy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 15:58:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5c7c0d2b0aaso2746657e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789055882; x=1789660682; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OPTjfya0LFf2qCHyAL0SFvTXEp2n1zeZrZKQw3Z5r+s=;
 b=FfYc1d3hFH+EX1ltN/zV2GZyIC/dgTb3fdGHkYbjEl8Y8yr0lmNWDdD+Sws8X/9/1H
 WV+Ns8El18FDEdfGVB4bKZIPYvwNTuVGheW7ARY8LM+j8TnU2QXYUyVkVLM/Adkizsgx
 6w3bvdMQ1lAgdLx41E9dRYSFojTDGn7JpDZ8KvYIxaSwb/TAb5korZPlR/Ov/P7HkqM0
 QqtZW51gZx7awqHO54rNxYkNFZaKY5ZudKQUm3SNa6NWYSCm2RdjlVoLXK0tPWo5mUmE
 jzBqNEsj7J62ZQ6RpT/I1qa3Ivir8GiUO18qIflxdQfAxBjQOFn8ygOV8q4VBUhP+X6r
 alEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789055882; x=1789660682;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OPTjfya0LFf2qCHyAL0SFvTXEp2n1zeZrZKQw3Z5r+s=;
 b=QfYagDRb4Kn0XU5pECOxrtPxO59YNpt4PuzGhF1LLsiYYerbA842fb7Qr5A+XxvVIr
 7BJYoAEBjh+YPMlpb7cNXDoCPOCOEevWNtDW4AFy4wZGlgrC4DqEmE1Vw1hgE4t9OMlG
 q01vtXPHWafL+/NjGtw21Us6XnFwNZLW/kf0g2mQn6m3FWfbtcK5c1FoAekpyuURvW81
 yyMipGE26pMJhC++emV9ndkZZL/KpCOVwFI4FLGL7u4rlNeuwnSDIWVW0OMbP+93rxzm
 HzP8YDQz1Rc67OrU9GEfaUy0RPqr8OJVi4wU985oPfi1gt8uHIT3/PJ9zLQH4dpzWj90
 WF6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzladCon3JTdPRiU36PJAU2hlgcBFLIUK3LC7//0LZyAVpnZ3PlwAVvpjiuriIV7fEyPOSSm69XCfSX@nongnu.org
X-Gm-Message-State: AFuF++mtEu6bsg5i4Iu5F+0uu8a1BXMrbIB6PmntK77qL0tU2qBsOqSo
 mILmgocWNj5f4/CfpM1S6ZqjM+xAL4BCdo4QsI8/lhs7bt1VGuqLLcDbiCVXCT6rvxTKNtQFqNo
 f0zy+RUn5YHpRDgvEwd3LExWcmrr0R4GBdeUlRyJ75S5JegQk+Y/mOcicoA==
X-Gm-Gg: AYBFou2rKIodTWr4GQt6wrjqQpt/M9kx2i5STmKycP9xflBiVccb9HAM7w1pmh9w/6L
 y4rBbP0h8Or+TqLIzgfaJX+WLRXuJ/mxNB5Sw8FjG0fGgheSRsGS5vLusi4M/I74q41AxzECB+k
 H2X8WiYdmdz+VR8NoIO1NrvDj5DA1rbTr5dYhYXynsyPd4FS+SoiLRA9r5btntomb09jwmbnXXS
 rRUUg+n/0AlUhr4/yE/CeF0vBzj9EIsMj/d2ACrPTRWZsB7rPlHx2JsYZguo+X76sK5enG/7yip
 tUsVmYT265Lx2UHe/zHpkDrRovDOUCRPwcRVEQJ6d51pzFc/63zUggXLtY/y9w/dL/aUY6XVrKE
 chReh+kzf1D1a5SlKHfzPIFC/2tO/ERAF+XBqfw==
X-Received: by 2002:a05:6122:4f8c:b0:5bd:aba5:3830 with SMTP id
 71dfb90a1353d-5c845d83f7amr307403e0c.0.1789055882579; 
 Thu, 10 Sep 2026 08:58:02 -0700 (PDT)
X-Received: by 2002:a05:6122:4f8c:b0:5bd:aba5:3830 with SMTP id
 71dfb90a1353d-5c845d83f7amr307316e0c.0.1789055882047; 
 Thu, 10 Sep 2026 08:58:02 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26be3e35sm79683545e9.2.2026.09.10.08.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 08:58:01 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:58:00 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, Sunil V L <sunilvl@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v11 5/5] docs: add riscv-server-ref.rst
Message-ID: <fmojfqv4gzejcpme5ksfephezhl7xtd6wwky3zsklctf24juh2@237hdphoupo4>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
 <20260909210756.1767711-6-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909210756.1767711-6-daniel.barboza@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NCBTYWx0ZWRfXzmiS8xG4ycfC
 B4b6PWVU7g06am2upieFZN7+KRWzm8ITylAekt5zyN/XeQGn2avFnm06NPasVkJlq9wq/9qK8sb
 DmciHXkUn5L5qY0yPbQhho1IBGwy7nM=
X-Proofpoint-GUID: wNX-OjRdtvVWEqtBQu9_QXWm3N3Jf4nO
X-Proofpoint-ORIG-GUID: wNX-OjRdtvVWEqtBQu9_QXWm3N3Jf4nO
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2d38b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=INa3_cfVNqtrqgI7vrcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NCBTYWx0ZWRfXwG0Jebt9Szhe
 LjpO9vblp5wlFZR0+1m3qkE3nQTYgVN4QDZIEtKE4dJAzKp2rw/8PjzozE/yh39XfmeKKZFDQeS
 F5rJg83E7+l81nwVrq8yy943xkyktP/CFo8PsckHf+tTL4IkrzVxz5xnOXy2a5Y8izEAqX7sldf
 H+VTk7Akz49+j5NoAlYR2P7WcgtrLv/NQ3r8gaj2iQasGbmU+IiLkdWDIlfasazFsoxjk/6b52G
 uM7uSFLmBonJYpm9yJF5rg2nAL3RyAsiVZCPAfc6x+1J88GQ05xNSCEDIQZk38LACsCfUApC8mA
 SmDBTg1sk6n4JZk3YDmWQeS8TJP3sdh+GjxromUbML0zxSbA1dx/tL6p1DWHAsjjWltTZI+eCa/
 aG5YZfuxf+Z2CUji7gXnkdmZCsQdwc+mHXDSvgDCz4U1XV2n+sDQwh0Q1LCxFS457G6Y4BNqfLb
 A3C0zKwoaA7faxBE5qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100194
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Wed, Sep 09, 2026 at 06:07:55PM -0300, Daniel Henrique Barboza wrote:
...
> +     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
> +     -device ahci,id=ahci \
> +     -device ide-hd,drive=hd0,bus=ahci.0 \

The image is named nvme_disk.ext2 but is attached as an AHCI IDE disk. If the
default AHCI controller is removed as suggested in 3/5, please update the
feature list and use an explicit NVMe device here, for example

     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
     -device nvme,drive=hd0,serial=ddaaddaa \

The documentation should also state that the base machine has no default
storage controller or NIC.

Also, checkpatch reports that the new documentation file is not covered by
MAINTAINERS.

Thanks,
drew

