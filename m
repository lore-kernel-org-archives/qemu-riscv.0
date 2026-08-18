Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D213EC5DF74
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 05:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwCUR-0002xB-En; Tue, 18 Aug 2026 01:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCUP-0002wM-Ie
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 01:35:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCUN-0001KS-NH
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 01:35:57 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67I2510x3602744
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 05:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tv8WEFvTLP0R36e98eKcYUGWi2SVM1jZ3sBvl+YnnPA=; b=l5yJRCXqhfs08D6q
 IWcbOUoGWIo8G/McXRs8pt/nDztZxFesKZKcdyJyyZY6lu2mq8XnG/pLxPFmhzB9
 jhMJrzT2a2OPCmqJI7HB+clonXiLzS/L9tkwlyeUhKbaAqjXeAp5NLERglSTNZHM
 oKzUUVMqUCiqk8efxgzDj5mN8ISnF9re/uNYkL2f1DSx7GbhXJsBzqm8bTEPDbFP
 lCrKTFHSLT9DNYPnFNJoUlANeihj5sff+Nnvh+cc2h1aINM6HIXuXshB7uO73ZUu
 KWc1vIWKgYj64+1uYGNfHFkNo03pgBtRsg+I3HeLjvW3kHJ9I5h5IndTT5IByHFj
 dtxWDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2gtrn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 05:35:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e9a2b95b5so733888685a.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 22:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787031351; x=1787636151; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tv8WEFvTLP0R36e98eKcYUGWi2SVM1jZ3sBvl+YnnPA=;
 b=DsY/wT2GDQEh835cZ4ARUBt0b5QmeTpt1QUIpw3b9PjWpfhFQ5kJ4Xb1hu1CxMEktQ
 PJ6GxXWLRh8GkIXUX5z7HsUEaPXe4ftSj5l0r8lwjfdjcXi6Sydl4t/enrjufuQun9I2
 YDsW8BkFdSkmqeX2dDYMzW9uGjdKej6kBbG0/2u8Z0HgYmitPMceXJaOtDhN2WL+Drrl
 CRLsQiw0Tx4YdtiUVNjJ7k9A5cSdAFX0jtU/q9AnZXGlE4O9Hx7qQlzNPYf98/L+9mqb
 8+pwYuamUWobL4KSXx1dy5GPO9TgQRGpiaF7wGZ05Ymh+S++/PcC8N1KlDFwMUdC+ynC
 +FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787031351; x=1787636151;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tv8WEFvTLP0R36e98eKcYUGWi2SVM1jZ3sBvl+YnnPA=;
 b=JsC3waBU59d3Sgcll68MMGFaQJnl85CeDl0NuF+cGDbEupD/2IdsiBu1FcCEGbazgC
 YVQIPzvN9AHZcLd+SXS5oYbMMjTdXOHWYJeDv51UlZXem+K7WW42CbnsQeeP4ezAwazQ
 l6Uas4zf9EEBNzl3qC5jEPfuDRlpU1esSOhNQbs9L2xNK7CbeeVZa1x6vlR7nKmxqsnM
 uvO/Vys2vesBN6a8KLbICBGyyMVOyzkPC9Kkx0nmv54qx8Gqt+1KIZnhIWMnw9AB/Jvo
 gxcZSBy8DmbFBdKSKTUJ4SRg3Bn+qknzPy5T0JxgXvB/i93oxWOyFrSq+O4BQiKKwN9C
 FjGw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpc9DoP36q21IWA7TGBd94X4+ZZX4PhCWR/cWQ8wFYp7BKFkkhCXhWU0IlOcNq5q7tdG/qf9CpvXffy@nongnu.org
X-Gm-Message-State: AOJu0YzOoCXaCAKXohC2bcdXfKbN2R59EE1szvLkP2xkE4Fo9s+x/faG
 rMBSKvSfo3zwqGsrftQMYadI+OEA80fxiDcjMTITHksnXGvaJBZ5p0JvwAD6eATloyon9hu+hlZ
 sUvWL+mtBwvdCuiTH5kQHJZW8teFGZzD4mn1QuWF/aw2T6pjbDwcgxYRwaw==
X-Gm-Gg: AR+sD13YVMIxCjOr0oHcDAqYHsCcrjirCsnVxfpR806ZoGeVM3zVSLU05V08ZkDV47p
 ty0gADBjaUQC8nZ9qpB/fULLzoJ3X05VdQBkGIRVddoPSv33Bmvafsf7HviarW60n5sK3vMRhFH
 UfxCCcC4S3EL99aZgITPeCKAKRwG9x9vP8D0xBfXxd8oT2zM+Qn/H5c/z0eZ77TmtTTXEENHBBX
 rSQ+fAl9kKsM6RFFGMbDPOYgTww0E0W/seuTS40d5yx0qWiBpGonEHeNT04/9HPpoy2dEDLcL9J
 3G+DX0Ul0hIgtV4VoWafioBTaVbZcQVkCOIl94IrNoGyf5r3JYEqf+JEbgD9Vm7E5+l4Cnvnnum
 hxvij4GSqYOREPEFxH+useKnBKJvZWcO/5cM=
X-Received: by 2002:a05:620a:2814:b0:934:a12b:1d41 with SMTP id
 af79cd13be357-936d22ff13dmr3080562585a.33.1787031351144; 
 Mon, 17 Aug 2026 22:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:934:a12b:1d41 with SMTP id
 af79cd13be357-936d22ff13dmr3080560185a.33.1787031350734; 
 Mon, 17 Aug 2026 22:35:50 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7bc6esm9715502f8f.19.2026.08.17.22.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 22:35:49 -0700 (PDT)
Message-ID: <6cc52634-67d1-40ce-8787-e166683caf31@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 07:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/18] target/riscv: Pass first/last to
 get_physical_address_pmp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfX61kjmYAfA9rn
 dmvaL2snT3PwC1K26GqLGcCzJF/6rpwEQPcET32+aGJuWCBJXsJ4ibWZ5lpkwPzBwPzea25ePPg
 NdCl3UdW6766WW7qY1YB6OCRVavmvGFr95nhj8WPSjixFFWNKkMFpGcAsfBTcwJkkPD7upbWmZt
 S1Z8epXxs2fVU/qkQPyycb6o7qXgsw4C/av3UTi4R1UwTbvIqRb4XdoaU9anwBFM/GWD2Wn8QfZ
 dnC7U28OyKWTVvK2QQFJEMqUkfj0JonJn4Spkwf4pi0ElQnLtckPL7fSo+0BAKjhtQ2TzhxwlOY
 zjUj+AVeHtq9E/Lw06ckpzxI8VnvYHlHidZd8m5P6s5SnfFK6TMby9GLKhsKgZH5azTXtpzp8JO
 icIpD3AztDkFhh8PC7gt6AmOp5c0+UWhKLE0goFWjya4uGLBSQvtlLfIUAuM4MHBQcgn5yj6SOI
 rcuqOWEKWpMt793oGDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfX4tKyYAVvoOsm
 UEN9rHnFP5GwixEPKf6ysM7NhSK6xpg/fUgeGC5VrL+FprhHB32A3vgBfOwzaFLlCZHjYvEjSzc
 oSYaO9bjRZ8gBvLdM0ri5gacWZdLafg=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a83ef39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bSeteNioDOwiHrVFRtoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T6o1jS-fLA4l7hlEPRBaIv6RZ8Vsitv8
X-Proofpoint-GUID: T6o1jS-fLA4l7hlEPRBaIv6RZ8Vsitv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180039
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/cpu_helper.c | 48 +++++++++++++++++++----------------
>   1 file changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 3318e82ea7..fb1250a4b8 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -899,12 +899,13 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>    *
>    * @env: CPURISCVState
>    * @prot: The returned protection attributes
> - * @addr: The physical address to be checked permission
> + * @first, @last: The physical address range to be permission checked
>    * @access_type: The type of MMU access
>    * @mode: Indicates current privilege level.
>    */
> -static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
> -                                    int size, MMUAccessType access_type,
> +static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> +                                    hwaddr first, hwaddr last,
> +                                    MMUAccessType access_type,
>                                       privilege_mode_t mode)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Orthogonal, it would be clearer if get_physical_address_pmp & co
were returning an enum.


