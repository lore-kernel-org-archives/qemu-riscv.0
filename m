Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102960A3802
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVd9XQ/j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPRTbgvk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVR8-0000un-Ie; Mon, 09 Nov 2026 14:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVR3-0000uB-Rl
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:53:46 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVR2-0003ZZ-B3
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:53:45 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHHqL4001652
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jQYcTnG4iDhqgGaWyx8t2CwjlEHzPUxM+vTs2eX9wjY=; b=DVd9XQ/jivjgUFor
 r+rV9sAutJWeejAihcMOM8uV+NVfuJYZZy+Rifd9+qxqjYqe6ZmUfZ5MJfkzLPL8
 zIlHqWXFnYHAH/I0IjVE4YsTTDqG5szRD+YhDwg0xxq6rWv8kNH4uefQa/WHHDDm
 /zi8/2nSIINHcgXPkX8PE51zJIupN4d6I0Wto83MBFYqcMrkv7bGS9qBXl6hmPtx
 Frcus+OsWFX6QfADVQMtxXA3++utrn0Owg0HTjk9bIKSzXKHEca4LgO1lAxj+1o4
 CwiN9VKVxcCjyGhLCPAqo8zodXOuxI71pYdV7I5yg61eZT7wgeOSDh8+lTYI+fOY
 zTJe0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rss39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:53:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5338c215ed2so19345751cf.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254022; x=1794858822; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jQYcTnG4iDhqgGaWyx8t2CwjlEHzPUxM+vTs2eX9wjY=;
 b=PPRTbgvkMvdpUB1uD94sG/g9+Aktb6Azyc1ViRgKzhtWsVsz3y7U1S22IZ2VwHZtqF
 tTBt1ffUVr42HI3yjzWqBetUGTzXdRoKsW3yRfo+dC2+91MhIwrqXSRLH/9VRahldwRv
 eNeFZJVoiPQgtBpOXG+dQFZx92iOIEcqXo4Eg+LAbAyQFuR0BUY4PB4ILkqQV9CX7xeS
 6R6A2CnUyZiPkF7sNceEhkGdFh7bT+3dEB7UmfRKKdCTYAxyhw3nEKiczBFpmQHaZ8EE
 gozuWoFcEQ2zZGo4+ren651FSDG8vDDL3tsr3sIhb/tKQpYNgJvcP9TJovbBKQAGC7rE
 0LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254022; x=1794858822;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jQYcTnG4iDhqgGaWyx8t2CwjlEHzPUxM+vTs2eX9wjY=;
 b=HHFv/TelLxHOOCDXJOKx079oJXEHliZnPt4KQXog2+E0oiUaXvL/mDYWMqYc6H3Ghf
 +UUfP85dh2Q52f0SH/g0iN8PshFb+Z6aU0TqwvV+y4/xPyBO52+XjZXc/NtsDPhg3qgA
 6g3D9ZCR872WMAf44z2uuXmQUEhAz7SkavtkJqWpDKcFWywvCT8MjL2tzsGjJMMF35A1
 uM42+R6uA6QPsoshNedRpewcdeSWW+on7Vf6zt44lP7aRFyFo+K+uYlKYGETjW0yXQM1
 9Id+eXH/Q3pwEAAq3Ny6BxT0lRuBIEzkPt2LVMvOhG7nyR6IX8BER2zJKr3loZmWMH98
 E7ng==
X-Forwarded-Encrypted: i=1;
 AL+hErHFQEelWB+ZhdgJm0XrarZeY0LMZg5xgLviIAMOmr3ury4xVVttGwRbFlPP6lwc5A5+ICTyZw+3vDPN@nongnu.org
X-Gm-Message-State: APuU4Z9zK0mqHKXycIIfiMqmzweKQnGmvO1mRC8+AtVYdhS7gYn3GXBO
 3GgxPnP9QffBzGs8wml+yEL4w1avjHiX08wTVvUCWBDpLzgHNggbbBD3WdbniR5oj4TFa2f2ypw
 0/BeGXtK0LGSqpwP0b1+f0lSCa5Ql2ovmtfjMmu9QbPlLnkdGLX7eL46AUg==
X-Gm-Gg: AYBFou0Zi5IYL3mMStbhoY7MfHW52ez5FAsRP499TxhXZjYtUjw5oDxPQM/DMvhn7os
 e8N1E48aypcZLarpZNzvjuG1JRyK4pl49zEMCXNNyslPMrx2XNEGYVDp+9a2WmUUrPvM2OWgE1O
 1U5MR8FCzRpKP2MlmZWKcDUvAX2L+QrEXbvi3ElaiSPeQqyhTxj79s2C9nGlyTeXlxu/2sqZLVJ
 1oc6VP9YKhki/CJszqTGrFJ7zsK8p8flb64i8fGmAdzprpZebolp55PnodG+piFOFkHpAlNLVoB
 xbyI4ksobLMpBGezMsfadOrrc6rv+y6eFU51GcnDsmyAM+jncvK+fW5sdO+BxRiUPnMPSUi4bJK
 9lW2cd0KMDusmZAgOd3qHqmnEBsCpqVK7+B2UibwvSw/4upQ0gftiGnqQDx+C/klG85AjpL1Oug
 uel0I3CPGd
X-Received: by 2002:a05:622a:506:b0:537:5488:ada1 with SMTP id
 d75a77b69052e-55527a173a0mr6040211cf.32.1794254022184; 
 Mon, 09 Nov 2026 11:53:42 -0800 (PST)
X-Received: by 2002:a05:622a:506:b0:537:5488:ada1 with SMTP id
 d75a77b69052e-55527a173a0mr6039721cf.32.1794254021735; 
 Mon, 09 Nov 2026 11:53:41 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm5256721cf.5.2026.11.09.11.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:53:41 -0800 (PST)
Message-ID: <11c1a22f-6773-4958-b04a-9f98d7b74781@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:53:38 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/38] target/riscv: Introduce riscv_init_fp_status
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-3-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NcsuqmhZAjSnoSPgxwNPSQPg23i9Hpge
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af224c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=gYLf6MvG5Hm1zaHzDX4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX1iB8O88wUVWX
 bgWKyH6DVhcGfXNv/phTT9AcUM4/hIuvP4dCIoyUyEogA39vbVrapjy/eGkvY8JKLXiBIQJlQok
 imCIBkT4CeR7AKhEvc4CQow2ny51OLs50pGR5TSuZOi50fbnBaUKxqywaFwijQam6HypEtE+bZo
 oib5xQkR2FrT2j2kdglZM/j1YSR57RStklxacv8CSj+1SfxmEM+wgH/1m2D3Sic6mP8OcCN5dQi
 LDHLfCLr49y+DfxlpQ9MKwwI8uhWQRf6FN4MKzsysi0f4sKbzofn6LBXxXVx5z8pCY2o6lSUTsf
 nmCG9VL+3E9dWrdkH6jp6GA67D0tmZV6sdBCqG51B4lm16ZbW/QgwpmEUaec867WiXQlyR3Exc6
 wXZrWmXL0MnWgBcXKRbP4e2x2bU/qOfr7MT4MWQ6ocTmHMUU0FguQbbq6zijCw58HGqHamTfeMd
 zwRpTfXVp5GKIXV4y8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX/69AidyttPQh
 AGphAW9AElL5CRTuGqPWbVVDCwVzIPZCxWgFRqUoRuASDUHoJ+oIi7d0pqYI4kvZX53Rlxm7RtQ
 6HMuA+cjdsnYddhVKqQL8GxZzJtkcSA=
X-Proofpoint-ORIG-GUID: NcsuqmhZAjSnoSPgxwNPSQPg23i9Hpge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090078
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Create a function to set all default controls for the float_status.
> And set e4m3_nan_is_snan to false to follow the RISC-V isa extensions.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 362e5618091..53ecce8c398 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -978,6 +978,14 @@ static bool riscv_cpu_has_work(CPUState *cs)
>   }
>   #endif /* !CONFIG_USER_ONLY */
>   
> +static void riscv_init_fp_status(float_status *s)
> +{
> +    set_default_nan_mode(1, s);
> +    /* Default NaN value: sign bit clear, frac msb set */
> +    set_float_default_nan_pattern(0b01000000, s);
> +    set_float_e4m3_nan_is_snan(false, s);
> +}
> +
>   static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>   {
>       CPUState *cs = CPU(obj);
> @@ -1095,11 +1103,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>       env->xl = riscv_cpu_mxl(env);
>       cs->exception_index = RISCV_EXCP_NONE;
>       env->load_res = -1;
> -    set_default_nan_mode(1, &env->fp_status);
> -    /* Default NaN value: sign bit clear, frac msb set */
> -    set_float_default_nan_pattern(0b01000000, &env->fp_status);
>       env->vill = true;
>   
> +    riscv_init_fp_status(&env->fp_status);
> +
>   #ifndef CONFIG_USER_ONLY
>   #ifdef CONFIG_TCG
>       env->debug_mode = false;


