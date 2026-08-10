Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAE8C5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:41:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtFwy-0007xe-PP; Sun, 09 Aug 2026 22:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFwx-0007xP-T6
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:41:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFww-0003Zg-3A
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:41:15 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679MKcuK3645155
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U9HoUyML3IsiL+ApcHnL6Xn1gCnmykqyZZBLi2ByIic=; b=Ugh8iS2DijuSK8Kh
 iH5X0yhN4LKZqWKeXZMyyfLVIRE5FhHVrNGsSK0TfnbovKS+pPtz3t6SvkA3KKJs
 vN9rAmHBOTTksFmYz9aD1sPCPGvd8Tfm35r1WtaCPCzFjRHOXHJt6Lc1AEmfMDqM
 RNroYby75uPHIuoTDXSE4YK+o+Mt01T4m9FF+QGYwtnLVx8jekvi8LmuTl+Y9ZnI
 lcbi8ymi2/SfFnpdqilQ+NmaIfiJUsa1hLmPyeBvmvNTIaiotrPSgh8+Futccy5u
 eJ8fj38o3VDG0i/5X8cyfi6DapYb1t2TsW1huXuRopdKR9LwBBfKq24UhglF0ESk
 4RFumg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8m21f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:41:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso24291561cf.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786329672; x=1786934472; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U9HoUyML3IsiL+ApcHnL6Xn1gCnmykqyZZBLi2ByIic=;
 b=EVnNjyFkz/Rvd01ExeCxLvJEiG0j0NYDMU3tkuJ5i2oUduLQTaCSOxYRL6g71KzbgG
 WbQoyvQT2UgfGU/AHDeDb3tD3WhAoLjU34vVLvlS/qlLXuzxBhENt/zqgR4fno0WkVa6
 X/RnjZDZcq4MMynTHvYfPR1hefylp7aHwy5S0MnSu8ltIar3pp61JIMll0crVn6fo5Bw
 kD228fc0THSDxrABE7qLXoXGx/bCvI6UcJtorBEibuiy0bI1oZpJlTre7m9KWOIe/w5+
 /wk9UmQd3QSS7AlsKp9IzYteBfst0AY6StVpRZiqK0lBgfTjMH0ZTljZa9ZANNQJzkWK
 PiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786329672; x=1786934472;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U9HoUyML3IsiL+ApcHnL6Xn1gCnmykqyZZBLi2ByIic=;
 b=Jfp+TkLVoLjqrgXLIWrEFEpw3hFaX/irbc9lPiuTy20dr3VFufhvAht8PC+NUC6QD7
 G7QyzRXd4rThPM4ASa4sjibskscXC037l2yrdMgBPTWQHeLOEHhCjEhhnMxWxSKQ9rP3
 1Ti+IH5y2Goau9DcYl0m3tez5OVCEGoIXzbazqrCpOSJ6js66+/mRoQyh5uauzmrQQrS
 Ea9OKzn5UbwuTkcwgXlnQOpqQ97yGl4uA3zFhjkclwEsCTBdWBJC0U3oUb3/46jZIIrX
 VlpbqETx6B0cLC9ix1z+64LJ2gfCfamrQZB2zfS1xLrJUxtnrDBjRY5fPofDmnpWG7bK
 a0nA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpH/fr1RhQQRNyzYv37GJKq9PohKvPeLoIzUyXbsT21rcQMHclbJnRYFYvcKAptcqm7aQn+9+1z1YMj@nongnu.org
X-Gm-Message-State: AOJu0Yzo0k2K0TRwsgwx5ih9MdRzrxzS8FWNaeih69A0r3dn9YAITBHK
 CxoPWop1Xvtx6lr2uu92TIuwhR1xbf/v1A1ucTO316/Bdp/R1A3L+QN/qFgpZd+dN/MgE2H7lxj
 uiher/sU+oH5/26fuklCSTnz+hzbclSj0KSkpHX5Nuo4yZjCSqUjCBcGRPg==
X-Gm-Gg: AR+sD12rGRrxT90V5ul9gjb2y92Sp8v2cTUGc0lm2wc3Je/5K5UMnp/YqlC1JxhhCk4
 ZWnzkwBBQZnoa9QjWxlkxn2oq2tidUl4TzBZc1/NUgvMnI2MohdizV8mlIQlfvNnVFn3BUhAr6B
 s+iX5rT8aF9WJQt5s2FxGebM8fHK1wmOUUw9MG9PZrUYDS1G9aN9z2EL1hENI38RgV85q2LPKhy
 WqVLbTzBoPF/mJY1JvNwQWnkvJEvrr9PEzyzc05/hDaZTivnQ7zABMH20Z/bPwV4miHdqkDxw1C
 KlX5/oebvePxoXYTuuYTozjIA/BhMGhbMfUblFiFuxFU94aWBwK/JXeB2l8cVtl1bP67h434Q/L
 FlRmbtRoyAHRyRwfmxdiZE9rzA15t9bQB6aI=
X-Received: by 2002:a05:622a:17cc:b0:51b:ef2c:7bf0 with SMTP id
 d75a77b69052e-52d0b2227aemr292514521cf.35.1786329672319; 
 Sun, 09 Aug 2026 19:41:12 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:51b:ef2c:7bf0 with SMTP id
 d75a77b69052e-52d0b2227aemr292514331cf.35.1786329671943; 
 Sun, 09 Aug 2026 19:41:11 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea27b29sm312986395e9.11.2026.08.09.19.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:41:11 -0700 (PDT)
Message-ID: <d2a22df7-07a8-4cd0-a234-a328a1bb3f98@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] target/s390x: Update capstone disassembly to v6
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gJMqrf5Ycl_z0GTY60VGdaXyHt-wuVKI
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a793a48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gJMqrf5Ycl_z0GTY60VGdaXyHt-wuVKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfXwGMTwWPmiA63
 6Z6s5CofCYKbeSbJ5H+5YJrObH1vj7Y3xTTH33eGjO8tYohSv3Fl+7BhlhyZeSIpYdnTJK/drFF
 zQfNtcOJaLnD/zSTwPlDOMpjaOfz/agay2m5xV779EFiS7m2qjcLeQwCa9a7/9ma70amqHEUMRv
 /4krGwQfm2k9QJ5kvBacVQUyMBfi8VftuY639aBq+lHWYBe3nvC1N5J73cRWSV606aObhGYU2rD
 /xQ5JM+OL1mhjiR/PiZkKEDPoLxZn2lEbRakrmUVYfUThEIgmKPAD7OTWRs+8ccKstTsdW4RpqY
 oEQf8FY/rktqsULXnhej/vGyweUjjNcvMfsqFuXy7kcSNRfaNSN5NguAQsakcfcxGbOJYbLdC13
 Q84hk+ZXcczR5MrNk6/Jb0G4/u1zA8PXI7Eb320T8f+Y2UqBZz6IIf/FUr3ntJp7GZfAtz2lxLn
 bc4wWoSVv9SgMSy3mRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX5lxATJ1MWAUS
 NaqhAfSBaKq92RiL4W2b/mFPJX5a0NR26j2b2xxXkrb6cRFu2V2tmDh6cZ55XGpuAX5ajzlcL30
 /cRkNlZQgKoZJvbKy36Wp3nMwOh9L2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100021
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 9/8/26 03:33, Richard Henderson wrote:
> In particular, this enables many more vector insns.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h | 11 +++++++++--
>   disas/capstone.c         |  2 +-
>   target/s390x/cpu.c       |  4 +++-
>   3 files changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

