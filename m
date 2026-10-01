Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D45FCA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:26:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOI8-0002NB-5O; Thu, 01 Oct 2026 17:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOI7-0002M6-7q
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:26:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOI5-0006jB-Lp
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:26:11 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691IZgS12019007
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 21:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UaPlJl5ecxe4XGBYPAIKLPIleL6m+k20Y+Mafu1TApk=; b=WQtxT/sYHYQMPIL+
 5dqk21o1ufiZdjRP7JrTMbFLHzQFOjRDTYwGDBCwco0HwTXYXxsWtzHJC88SibC4
 XElOB7xk316a8swXNYCc6NH6d8t1rbXz2qKMQW30TQADstO///W2jyrRwhu6hA/j
 71n/CHL9+h+jnwIJSraHOHo9hu/e7WxH5LmyoUQo528dg0Lwp9zPMjX5a9yl0E+B
 zq5gtn1tQdZhJUr51iMAanwLC+9+aCcK3I6EQe5ERxqML1F0dRfxJSggEDZaqLKW
 yRCK4uWwCoYZG0PLdxnKYZtxa3Fl1PbB9ha8q4hQOH3SEQgR88uH2ZcPfatZ/yMy
 dQbV/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxe8k39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 21:26:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34ef0362d95so699912eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790889967; x=1791494767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UaPlJl5ecxe4XGBYPAIKLPIleL6m+k20Y+Mafu1TApk=;
 b=etdWg8clqOhR3V6p1InT6CuB6HrbOv5RVc57ynK33bQydkiaIOrvl2gC5yN1rM2rEB
 VFZpa9fh5Nhxt4C8ZBL+HcakTIETxW+J17y7eadgeE/VgWX7k/xFv9r1DztbMmu7/nMT
 p5r+YtHildr3YEKm/A4uU/ysjwV+yjtcreuLMaW96qaJSU9VlcURf/nFnl1GaP5jrHUR
 XUsWVdm3NveW1/UsRWGEG40kXVLBnHhY531nOqTIAkqo6AYTVoQznoUYABMipygOFJ5l
 xI0zUuiJa1quTc+dLBl++OetjWEM/aAlLP7+66hoOomeNucZea0o6Vx6mEve/vl3scyk
 4j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790889967; x=1791494767;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UaPlJl5ecxe4XGBYPAIKLPIleL6m+k20Y+Mafu1TApk=;
 b=czMIg1houZG1/fykQk3Mj28kuzObeyr/+0Yg6IB/Wlu7zQWpSReg4WVz9ne88xPO+o
 ZdHskC0wYHU0qRiS8CavIBzuBUFaiCdODGqsCfWXn91whaQjhKYUwZ1VwbLdo50Z58we
 4U3cDiGSUIxRsem3c1gaPFIKip1GA5gN1pHOKYcfQFTCosS65/iuYB1AoUUAci6YRv/L
 MpCpZEh6zknOTu7s9TAbew/Kg9pAIETRhz+NmV70tzMh/fAAXBbDDH5RoLjhlsV+fcTQ
 6yS6pjfcY8TTNRHwQepb40ek/n/9P8Ob4U0saJ97yX1a2p7fWRE0OsgZR3bSuKw/B6Zk
 NXkA==
X-Gm-Message-State: AFq9FYKsUAAfPMH5KCQrQ1HINEeduu9SSCVKAAXdN5bz2Gu0C4BIy3TW
 yx4KiBzsdrzwjJtly+/phatYC0iGnL+9XuSjHD9AOhb1SdyVbemDioHJP8TWnc77MDoVGimk6Lt
 1lYSAWHhKP3iLVWntmCmUIuXPopFqrcoqQ0EnRCzqBW4XRS577Jt7HNkrdgTp9b8JMg==
X-Gm-Gg: AYBFou04EkkUU2bCBNVyGi+Q9RL1H0ctwxhMZKaB5Eba3yCLQfIcH4sn1StLbWCTEbv
 r5KvBDFaBoGEHJnNPjJFxmdQn/Fx6IsBvr42a51aSqQfs9yi3zfOUZF1uuO3ITasaVXoc/l+ldX
 JF0x+2oatZUOuGkTm43UMShaH58TFY/5J45eReW3xWUBh5cJQiSM2+Vnoz7RtJQ5LIWZjtJ/2A+
 aQA5YnqLlmSKcZQZ92hP4s3+fqpG8U/DJ0Ti1chdqfXnYfJ4KJ5qU1qL3huuewvFL/dpzwGO16B
 hp+h4RrvXCLHoHweq9cQCbQS0ircqClC1sHgWT7i16JebLlC8hiV8zXqS08gM0ThbGVP4D1Js9i
 YK+YHesG37zIutILZKq4MOxEFjG0+b6oF7HeWyY+2oKpZaGLXJXwxYyIxw+AV9TU+18llow==
X-Received: by 2002:a05:7301:6192:20b0:34b:7c9c:9a71 with SMTP id
 5a478bee46e88-34f14f2f16bmr616201eec.1.1790889966788; 
 Thu, 01 Oct 2026 14:26:06 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:34b:7c9c:9a71 with SMTP id
 5a478bee46e88-34f14f2f16bmr616173eec.1.1790889966107; 
 Thu, 01 Oct 2026 14:26:06 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f303e3sm1076511eec.5.2026.10.01.14.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 14:26:05 -0700 (PDT)
Message-ID: <18a57312-947d-40d1-b5ca-3f14398bfd9d@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:26:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] target/riscv: meson, add user and common system
 source sets
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-2-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-2-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abecfef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TyrF-mWrPYA9wU2PqH4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: I-CoM3CAcpqTcbZlxaX6DOWMc8CFL4kO
X-Proofpoint-ORIG-GUID: I-CoM3CAcpqTcbZlxaX6DOWMc8CFL4kO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX5Nef2/Rtywkb
 TLVwduPdveoiEVUjNDt15BrpnClDLx+gbRUdzxcOxpjghSAfnWX/ZfMT0D0YDWNCkdnWCnM6akL
 +D1Q0780rlPTRQ8et6Z4plV72ADbJHgWVdl5BwJEHRqlWDevH38rOJFyln3fySkLclXT4/TlsO+
 vEluMTya+KrzXngIlVPF/ZcQgNg5VDg/+RzZg3TEIy6HOo7TlVRVPSKOf8kJYWeO5Q9iXnlILrx
 9OTSUFujxExztat1JRA2DbBffxemkQKwkJPAtB1VcHruaVgos3mmyOhjudZjoRb+3MYDyqlDPmO
 4ayLyX8HZMCncAdmM2lt0iXt17gSgIsw+s+GSaE3L48SSLE/SLGNszSq8bXQkXbfCo0pHW6vft+
 sykkKZL1Ua9AgulOYlIwGooaTmcCOrG0HHif9DmjsOI+PNbIUbaBOVBPSyTXVrcHRZKnLYj+hoF
 c1EaUV+thQIK6SBz96w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfXw7nH7UB3JE6Y
 GGKEq89iylOJ45dtqXj+7/sfKi/rSktSuEX7mrUJwPxgXj8ucaqAl00Ca/ixbk0ji9UU1pstUsF
 SeywK1rK8IKLjRUoCawtVj9VCh3QFaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010085
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> This allows us to, in future commits, handle compilation units which
> need to be compiled once for system-, but twice for user-mode.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/meson.build | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

