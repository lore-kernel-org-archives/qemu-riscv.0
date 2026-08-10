Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E46C5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtG3E-0000RU-G2; Sun, 09 Aug 2026 22:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG39-0000Qo-0N
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:47:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG37-0003wG-Lk
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:47:38 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L8mcg3732947
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PdTrDhI+JXsXTE7X8TWgsDuxJb3Y6yJEI77/zJX9Cx4=; b=Hl+6+HgYHB04Z3DP
 JhTjKXxEAA4kPafAM9D3g5Yr4Eetl1E+xTke4shwCWs+e4BAlXPSsKbTFJTWuOS7
 t76fMuMwEhcQHb192odFQMt2p70ilBIz93CWKYgP39yxaM9tlwC67ebv0DqKHvnP
 NgRzhvvQZiPvT4H9dGUN28Tbpdp4C+2QJtYmHkKB7WQOTUXHNyHIapjmQzl5eD6S
 u8aJVbMGsFzrxhbNHRV+yGKVE7c526XasJAz+HxEhN2oNeTxF4MG4/OgLFXN8crL
 7IyNJ+oy2BgiTUmGXMLc1REketJb822szbfRhTtaVXpBLDMSodkB1/IsbLECdm9/
 afImQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush454x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:47:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso26053351cf.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330055; x=1786934855; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PdTrDhI+JXsXTE7X8TWgsDuxJb3Y6yJEI77/zJX9Cx4=;
 b=HzzUDPaKFvFsNxgDtzycjOlz/+S+bhz4EwwBKS+Jm5KGMaAWJovbaYkZ7TYXXhN0QE
 nunN8eFyDejgN0SrmG1Md8cX0Tuk1ceSkW3wXB3TZ8DjiANx106LPlwkhq4v8Ge7Pi6x
 aK6mlZjQZbmSrZAbxNA6cp8pYRpimvk7qfBor/T6DAcdcg6AQYcoHZxTTvdtDJ7G7+0L
 51jQDXN1MrE0vaVVUhr+5XjoNY3QHhxmd6wPlh03gWa6flHq5uV4sIE6+8PF7p0P/2Mu
 1MSCr2R654wDpQpsMFamKisAe0GF94Of9/qT5PSYu4IkNNCrNg0uvs5rjyzuwWwDhKIl
 zh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330055; x=1786934855;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PdTrDhI+JXsXTE7X8TWgsDuxJb3Y6yJEI77/zJX9Cx4=;
 b=DbqJI1Yr2zWsWqaBQqpgQZkesyVscpfqlVf46SSMZl+BZzBMnq5Mc0lws5RbPCAr5E
 AGoc1ov+R+hYBMhknuipS1ELiIU/EiPAcWCHtVB4xLXU3Q6HZC8+t904ZYtJ2FXyWvJD
 ppspgKd/AZE4Lea7MBQI4B0p37mEcOt470IapfYw7zh3HNDbW5NOSy9IgEDDqn23+8CV
 nQXaDTu0AGptLEcL8SeVU2geoMteJ+FgvZKydmzpEP6j248+UPAqZZLFpYAVUfBN7AQa
 JfWeq4cx3RkQfnSUZTlFYWYsZg8Czn2dzkeK2Ygt3zL4VEyWrL4R+i2ok+v46luQO+MI
 EtXw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+q0LdngdWxyrKyJ2zy6xeTmrXERQMdhUqft0KX+kVMIkXNbYVVXHRE6ZnWUZrlIXbu5hwjddAIljI@nongnu.org
X-Gm-Message-State: AOJu0YxF+MYDqIipESeCEYQzbCeVM1hLa761J99UEBICWYcBdefZPOVs
 lZfibXrRrxQkxJKmKCvHlrxTulhdDHMZX0CRH20cndpn5GRdg2AMgYQTTgeyITAEzDb7RCwpqmL
 eCfINunTCPWYi8YDBYFkdHVD+1cTEpWiCYUlbeCoVron6wWN+O0pHMypQTQ==
X-Gm-Gg: AR+sD10v8Ojbj6OBnVNV/aAfwlis/BqRtw8emxFHbzxqkF4ijKjzjJ8lxo662GVu0i4
 hU1muE2pSocOIGoE63oJnxXuxASbKEPoKYKe3n74NJawidtZ31D6WsXCMfGiXsZKtIqIpeLRHja
 9/eZoMoFwLb3lPH95IdjzLYYz9O9Eiyp0apUHK5gvP7/kIYYp0FKPWaTDLpO1AqEc3f3QnzSDPE
 SoqugnGpYp5hiMyXlAyKme25U0kBbaFssBp0LQOwdeYAJdsNSKVE21SEn0aa2bUY81EzljQaQvx
 Wn9TPUQGUpPy/YslZZfyhOvxZm0nAXbpu/5Iup4VSA9NHvPXzmxI2u864hSbLjaCJHcTaKELmIo
 SQoOinr/8LF2tX9Ev3/dGQFu8msIFXOEvZC8=
X-Received: by 2002:a05:622a:c05:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-52d0b21b462mr303350101cf.34.1786330055676; 
 Sun, 09 Aug 2026 19:47:35 -0700 (PDT)
X-Received: by 2002:a05:622a:c05:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-52d0b21b462mr303349871cf.34.1786330055312; 
 Sun, 09 Aug 2026 19:47:35 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002206effsm27099898f8f.32.2026.08.09.19.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:47:34 -0700 (PDT)
Message-ID: <66b51f04-4072-4661-bd2a-f2b80e4f5b95@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] target/riscv: Enable disassembly via capstone
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZbEi7m8U0sXnF_Q1XfEmgxufidr_FLFl
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a793bc8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZbEi7m8U0sXnF_Q1XfEmgxufidr_FLFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfX/ONWmcOuugGS
 WStlp8Ho+Rzz1RR67huhuPtI65QVPW7uFi4HLUz6bf0s9Yut4zxQyMHG8CV/PKmyk7hYonifWGi
 NtP2kDjCiLZ5ynAfhHEoHBpHVA0TgdzeF9fw0/4mNsvu5mQAkUrTblIYklxICl+B4Syg77rMJoB
 XsQwOjGfZGakIFnk6XL4RXGnR6USTgsWT2tpkBpWPaBdLWj+sIf7OEztPfWwwjfr8lPt/0lhl25
 CrcFlEzi+Sbr/3ZpDQk20KULLsDG4zO0kaZzGjVWPtTiOvtWEZFub3dh4ZrAjEU1KXtcX/4MOw+
 p1wg9s/yfDG8vfSoI5lnW0+JBEN/Lgar30+DB+KDZbsd6M5ZWD2RzLQ2TT3sKs0ebcxm9Vdht+l
 wGyToKL7QHhgQ5HVc7HWerENYNr4R2dWkR4qUCcERgkYDJMhNud0TuXbtGY9x1/yK9M1NLBhEtq
 06hxowvKACK/h8MAuNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfX1Br6uwe9evfA
 Tmnv9oaZt8hfptWk52uPdX1TUZCd1WF2ibBq4mr6bpqxT+T9dO3AnfUZQSqTDhljhAl6gj2IPC3
 F03ZTAlSMLX6gHkPKOJGHPOO+Mi7NHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100022
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 9/8/26 03:33, Richard Henderson wrote:
> In capstone v5, riscv support is spare, but v6 is pretty good.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h | 34 +++++++++++++++++
>   disas/capstone.c         | 19 ++++++++++
>   target/riscv/cpu.c       | 81 +++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 133 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

