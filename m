Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD96BCD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT27s-0001c9-SA; Fri, 29 May 2026 14:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT27r-0001b2-7D
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:40:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT27o-00025q-LJ
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:40:06 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2I8V589635
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=; b=Xyug3sSARIlWYX/x
 Ith4qLI6J3gFfn034GMoPyUZGRGz01GgUWgzQodTVoaQbf+D5iYVBEPAfBjbYOgu
 3sgwxEIwJTLzUI/5dWp925AnGKUF/Y+vc2f3B8QNi71qhXLjRqySpYN6SS37s3iF
 zZB4d8EoPsWt3+CaWMtsNbSyorkl2v1tmgsINEypFM+rCTPSeVgLr5BJfzaO7nzn
 NxL95tzLw/WgUCPobmhbCjzTiI9Zq8hOCPSVFgR5d9cXl2vHTg24Idi8g/GEXIj5
 uKdYWhz2vqakLkEJYxzVeI7gWCrXR/6i+1DZyE3628UZlmr+ntZcwN6kMiBAxn1/
 sH1ixg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcjkm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:40:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304e4636205so2965520eec.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780080002; x=1780684802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=;
 b=kpSO/WuXCjyoTusTrva15/ckI74fU6UNE2qi8Dk5htw6vSK33WJy24oLPXGdJX/0Eo
 ks1H4mtu8iERwv7EcoO2c0JbrNZ3t0Hk5ZQ4O8UrsjMK/alJfymEailpHlQvNe0DUqaO
 e8DNKUxDAHEDsG6mLXIn0VAnfhtaYF3V/M5jX4s3nSaAZ+XDS+I5E1/QPDP4FLzcYtE5
 x+YruA53MaiNTyjFU6F+t5vstaLU19UyAcu98YknhqTBWqyVKYZCzdrBPzBWlU49S39f
 DfA94j6LojEqWUT+fZWrX1LQh4fh/we5TfccXGOO8lloGC68g4eR5GJRKQ5nIYVXCR6E
 qyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780080002; x=1780684802;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkEQuCKrcklDQCnz7aw4dOFoxK8gdGG2aMehc/BQwV4=;
 b=rYnwPKuSR3yXBnk6omGENSsH7Lh8Ix3MMAjUiz+pOKoLznd83BPinQ+LuL++NVyGLa
 dzA5flyasyPdK+qvZk2Loaok7B9w8ZVs6gkB2xxaqS0c/YF0IB+BA0e92JJltbtUIC7k
 6hTLsYbGLUv83mQAh/qNTCiADV1lbsu/EHYBDjNWaPfDcy2JZ3vgOfs9xEEAKS3ILwky
 4WzRcQQIgT8JBm7hqpvuItViGEmGtKBPtn1yvObV3rRaAEWbMG9pk3wMBYhvU/I1amh9
 LLrHBJvwO3YfmIc7ba+U2TrpOa4IXAdQgLCBE0Hf4ZKgFT6wkUSJ1/gSQ38KdRG3Qd08
 6Wtg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sqEOXVyv99rm1XUz4ws1ypMk+/VAILSUvdOZSxtQ/oFDDsfC4oQ3beirIVV6F/hxyjycnjLw2Jj+Q@nongnu.org
X-Gm-Message-State: AOJu0YwFrBWBh2HnJpwrEQy18Sgn3L3rAUQEM22RTdZJkz+9RX/edJ6/
 IqNWqrqIbwPYUozf1dJ6PvTtOSy2UVrhcBQ9IhBP/kxAsFgA7pVzWt6vo1EbYQmndE+6kCqWwkY
 LXjGd/nggdDv2fpbe5Tc33Ys+VIEpq+1hyzuZCh3OX3U7GIDkcNN4on1hv5rikjP4Y7/K
X-Gm-Gg: Acq92OEFfI+HUQPAYhg2bfD1RaO2cnps+z6Qku1o/8Lf65Xerm3ZyBNrbl36++/Mw8+
 HdQDs/3LfDaCHCB/jpbIZyxa66pvwiCUp/GewV/4z9m1/q65OD7trtlBgdsb4TCxs6/hA18WOu4
 1YCAGgw98U8sB0HjeQ1Ynd1fdOnGhjDdr/oVXzMn8ULp8GPWC2+HzDgYCAlz2kzQazT5kmIzngS
 q9c9Wpgke+3YhVbQxRbG0wcUobAgUejLWwxwdJBbyxnN7S4fFYr+MLTElI+BVHULUUDdasQibQq
 RhJnCJ4dw9NZ9GOgw+fUazmeG0HjkN6B9tuOShv3dmadm4hjjSTk5sRuFliYQ+TH8aK9h56BFql
 K+1SLFc/bvhXxWhaq/zZsgI5O1IYdvn0Eh8pnbVhRiXGaEr2SrafhN1+qIJFfq1kpiYq6VN8RoS
 toaP13FDOFLJc39G1H47nWXACM
X-Received: by 2002:a05:7300:3212:b0:304:e72a:d4d1 with SMTP id
 5a478bee46e88-304fa75f26bmr499532eec.30.1780080002229; 
 Fri, 29 May 2026 11:40:02 -0700 (PDT)
X-Received: by 2002:a05:7300:3212:b0:304:e72a:d4d1 with SMTP id
 5a478bee46e88-304fa75f26bmr499498eec.30.1780080001730; 
 Fri, 29 May 2026 11:40:01 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c10c1sm2028341eec.1.2026.05.29.11.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:40:00 -0700 (PDT)
Message-ID: <d7666e7a-d5cc-411b-a1a5-1c76d0b6d353@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:39:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] accel/tcg: Convert RISCV AccelCPUClass ->
 TCGCPUOps::cpu_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-16-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JpAgp3M90_awbNrqoF6F-sOYfV8KBR0K
X-Proofpoint-ORIG-GUID: JpAgp3M90_awbNrqoF6F-sOYfV8KBR0K
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19dd82 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TJZcotH2JYSlfeF52QUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfXw4RIdUmKOZ03
 sKYt50FkBPPjY8EMvZLS0adnuzY1oTCfgvZspaDqjk+JGIgVxqFkJVAi9G7LjVpSbYEpKc6Tk+4
 E7wk4TqxtE+FWcRt6e87y4lpwr1bLBKB5NtJoRmU7aES/CC+PjB1X2tTvUHU8wkbq6jWVfZSIvb
 A86wI6tbXcKMHdsG3T3FaIyetqx1AAUhX1H2AOq8/LkGjzVKJjKMVCg97g98yKA/CBZOnHCChmL
 IlGNWjSs4/dljO4EFcdDwi0euZn7N0iF9rr5YrJ9l/asKrCAPnRv1JY+hJo2HlgKQQlQcIQyf+f
 YBo4xLrP6qZrGTWu2I16UwuDfEpxpmByTwtO3zZOzSVwmXDnu6RWGYI/aJ9cBKasB5/i+DFy+83
 uFpUcoxxLIeFmSEeUgJofS3MzBvPO8qWiKjGVJlBIvZLMuYcsr6ldVGkz7x7TMTwUHDsowZZVvS
 irU6VidOBDeUBRVOBJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Register AccelCPUClass::cpu_target_realize as
> riscv_tcg_ops::cpu_realize. RISCV's ACCEL_CPU_NAME("tcg")
> TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/tcg/tcg-cpu.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

