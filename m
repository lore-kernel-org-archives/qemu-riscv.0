Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE1CD98F0
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 12:32:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZpQy-0005YE-M3; Wed, 17 Jun 2026 08:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpQw-0005Xd-TY
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:31:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpQt-0005ee-TC
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:31:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65HBusSt2737314
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 niRn+dNJeIemlNqpivtJNkz0wB1fY5y3GFMTNzWzE9M=; b=KHdfh9XILedj/mEx
 qROp/oHMlmiq9dtWmZo2+uvcezE+GaYo1E8J2XNdVCNlTDz5XMZCL73KuDEiNueb
 MSpkqnoQWrP8/0l6mZDvWFtvK6TZcApaoraciOSg3uih5b3pDtdPmRC8MVGnQQ/z
 //T/a6p1b3WVp85mIQc1+3lSN8VQasNWm23hJ3k7tVzxYpc+b1h+us8132+pfqCp
 7TahKII6ZNDbmBJQD2HYRYCQrLMtGjixnluxn0p3zeD4Yekhh2FqHxSp8yaTEldi
 zkbFtknnAvITRGyb5EwcV1aK4zbcEhIjbTKf6zmRZyhXB9ROPxq+JO8N/mHoSVO1
 p5jvdQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2b5y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:31:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-48952d1c293so191759b6e.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781699509; x=1782304309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=niRn+dNJeIemlNqpivtJNkz0wB1fY5y3GFMTNzWzE9M=;
 b=DcFsPxkioLlBK/4tuyIfIDZPB89YtWfdvmvQif4x8huJHpwWFyMffvB6uANDuKsURe
 N+g1hqaZajab1Qoe3N4biyRJgS858q+RdA0q8+zZ0z80Q/zL5BH8Wb5l2SrQYW2SOPMH
 6wgB7h12ZslmfdLkanB5zi1Vjz0R/Lf1Zf4xzQvOpi3NscmL3hBLLVax0jmUunKWowMz
 Q2AtvirkXWJTXwgEsBTURSRwENwk7jkOPNlplf5HRJT+3bmqsRkeUikPrc4Lc+e3bNzX
 7c5C/SyF08V5KU0aHpDhLfxDGX+jJ6wZ/0c27z9+SbBbN1M6NQW+G9AbzlVstfzc6i8L
 1iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781699509; x=1782304309;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=niRn+dNJeIemlNqpivtJNkz0wB1fY5y3GFMTNzWzE9M=;
 b=T8mZs9ihkNLIFA6Fd4vhzpmPgxJrXFNgvgcYqOT4IH7Oms7Eut1cYxWQR2rPYmjEg/
 DX+WtoR+UivNZUlEFYPX+M+HSy3BgqUAVJmlHDwzefCo1W4CPJ41NoLmbsKz/7Wh9jXX
 S2J52D7JZD2nEvJs0MCR7f36rpnXiP5jE/cahB+/BcsPcLHGDxNmW45Fuwhx4WunrWKQ
 DqGf9bIJTWL3M7p9l7By4w63ZxLTxfGkGenn4NKBxJOOONt30+I5rwHBLJPpZoQjRjHx
 FeImEU43/6e2LJFRUW67wlkFyQ9uCEfH2AAlz462sF4O2vqyaqwjdyoPyC0OrGNxB5YG
 hMvw==
X-Gm-Message-State: AOJu0YzQxEUqKvlCnHnF9P62fuiwCDzFPIW88h7i3FlXeTO5aLicFbxo
 XVy0Psl602yOa/VSK7//0dyFCgjE/9rHw7QR3rtT9RBOZXJ8k1Dffpk0jdit2j085tP9iIURGUR
 /n3btjopVrh4SNEgNoCJuyF6SaJTfg/Q6swf+YtwolCb9Xp0fo6qGq4gkkA==
X-Gm-Gg: Acq92OGwNUr6a/t3Sq+0X1aJQL9MPYp92gLp6DD+Nj9KIYx/ifEXIcqztMLAZFcGFz0
 fwf9lNvFW8HtcU3MFVwP8BLg8f+pBreov7qgIXxBsxdm76/K6acnjxYdu2AzEK7IS6zBFz2MpUd
 sGEMGLvodMLl+2qNXCacDGQ1uzD1iylYfdr2q42sqcLj+ljrLcU8++B79f3M2hlrDvhInfXXVj9
 xUTFdnNLhUlEJMDMTN2mc5KQcDBvuYDk2Dz1fJnnnfPkAkuJ0YoGLLkWatpLxDdVHdMWsB7SGb8
 obej7rnLB48qWJjYn0tyCmziffq5TotMo/YZb0wdRpopxhekRIvue3mEd99Dmayvwo8CI8mXe3W
 YIqRPOzGU0vtDY/gfMKc1EmhJMJmPg+MCdG6wjTXUupUYRko=
X-Received: by 2002:a05:6808:50a0:b0:485:29d7:70a9 with SMTP id
 5614622812f47-48942be9245mr3417091b6e.41.1781699508785; 
 Wed, 17 Jun 2026 05:31:48 -0700 (PDT)
X-Received: by 2002:a05:6808:50a0:b0:485:29d7:70a9 with SMTP id
 5614622812f47-48942be9245mr3417011b6e.41.1781699507923; 
 Wed, 17 Jun 2026 05:31:47 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f14168f0sm68807586d6.6.2026.06.17.05.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:31:47 -0700 (PDT)
Message-ID: <baf3069e-7950-4384-a9f3-2a9abc0b05d2@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:31:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/functional/riscv64: Add virt machine AIA boot
 test
To: Joel Stanley <joel@jms.id.au>, alistair.francis@wdc.com,
 Anton Johansson <anjo@rev.ng>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-4-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617054034.1020724-4-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3293b5 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oNMWG6_fg_YX9jL0BucA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX8V6XMsHDUK6b
 59OLkbINtUl39/5CQkuE3y0U6p8mKOneey0poy3irNvRr2+lSKcO4Y/QUGNBR2b4a7CxLzgxpN7
 cOOq2qB+bxHq/+o8GjlSaFH6TCwPKbQ=
X-Proofpoint-GUID: 6Mrk5XX7eBmOEVO7pySBQj2-NKpG2D4n
X-Proofpoint-ORIG-GUID: 6Mrk5XX7eBmOEVO7pySBQj2-NKpG2D4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX6y2Lm2vp68Zn
 LRX70vcSZFNu1S+j81B+jIJ0ZtOZYGttjXte7jtH5tNrSwum4ZIcvEnjQPxv3bRUQ2o2Y9vbK8q
 9/ZMdbtDythhtA7hmP8AkO9OrPxvE1tCUYnhpVxOdGXtOSReGo/BzPFokbRWZRCeABsTJT3mvCj
 gRc6kEWsDI12YqeR0ROiSLCKEC9sWfBiebSWg3hAnHXMUSUw2LkH76GbUh4p4ywc9NOHVbVG8Qb
 BOdCkt65zCGeU413CJmqOwEkX0SMblxO2myxaTsOkW0qVuDxxPZQ0F+aBQx8DGrNXs/M/bvLS3g
 grJB9fiTwgLpPyU+2EEeUe2vH1zUQzh2vLdPUbJauyFRjpdDiWW1YtfelM8JA3/yg8HsD+NgT0D
 tEx8c+c+web/0BGQTA0dUl+YywsyyrbblhOaiX2EWs2uGZtFaDglwQL9deLwEpt2lr4sAH6I7ma
 JzSoh2nxvN7WwXSYHOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170119
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 6/17/2026 2:39 AM, Joel Stanley wrote:
> Add coverage of the riscv64 virt machine's Advanced Interrupt
> Architecture models. With this the APLIC and IMSIC models are used by
> Linux, catching regressions.
> 
> This test requires a kernel >= 6.10, as AIA drivers were added to Linux
> in 6.10.
> 
> Boot time is ~5s on a laptop.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

I think we need to add more 'virt' tests with all sorts of supported setups
and configs catch these errors as early as possible.

This in particular is a nice test to be added since 'aplic-imsic' happens to
be one of the most used aia setups out there.  We should start adding variations
of this one  (change number of aia-guests and etc).  A work for another day
though.



Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>




>   tests/functional/riscv64/test_tuxrun.py | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/functional/riscv64/test_tuxrun.py b/tests/functional/riscv64/test_tuxrun.py
> index 43d1242be52b..6203a45060ce 100755
> --- a/tests/functional/riscv64/test_tuxrun.py
> +++ b/tests/functional/riscv64/test_tuxrun.py
> @@ -41,6 +41,13 @@ def test_riscv64_maxcpu(self):
>           self.common_tuxrun(kernel_asset=self.ASSET_RISCV64_KERNEL,
>                              rootfs_asset=self.ASSET_RISCV64_ROOTFS)
>   
> +    def test_riscv64_aia(self):
> +        self.set_machine('virt')
> +        self.vm.set_machine('virt,aia=aplic-imsic')
> +        self.cpu='max'
> +        self.common_tuxrun(kernel_asset=self.ASSET_RISCV64_KERNEL,
> +                           rootfs_asset=self.ASSET_RISCV64_ROOTFS)
> +
>       def test_riscv64_rv32(self):
>           self.set_machine('virt')
>           self.cpu='rv32'


