Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A771FCD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:30:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV5L3-0004a6-Jg; Thu, 04 Jun 2026 06:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5L2-0004XV-2I
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:30:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5L0-00010P-Hl
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:30:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548LiYG313788
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IwKWk7HK8RzvFKOSUN3yns8Atz0EDVuDpIIcb+R3WuU=; b=Y0gtfBKRFByyZ2uw
 QzVVmPoPz/1G7tuBs819j09vwikEow0rc7GS1uFm/EVFP0ImvleUkKc3MjYrg4tH
 I7/5R9cvuwvKa6sTAs0Uoc8R2d8j7dKY7XpJ9T6gfv+waw7sloc6artr+VPCeIco
 aZ/0rd65wew8mlkXbxqQh3RVMQvJnyV6rqI9Q8DqaQbQton1eNlstIwhSsJqVi7L
 FOtj+kQBDP2wWIFCeYPh4pa0puTkUK+F0EV+7Pz9GLzAbT6pDlkq7LBa6awMBftz
 W4CJxts3s0I51DWyqXqGM3JQkKb9cNDRsB2ZDeuob4CFxmmYAY44Yy5/CYDNjFEs
 hdfVtA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v1we6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:30:08 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7eb18546ec2so6567457b3.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780569008; x=1781173808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwKWk7HK8RzvFKOSUN3yns8Atz0EDVuDpIIcb+R3WuU=;
 b=kp2QvUdBAecNXsKBExyTwz69tv9dl6oOCSP6o0v+Cwwbt8xdLWhh43gc5EFI1a6vl5
 9M0FnaBzhaUWiSQ/XG3ILZMVSAeyGexqtI5gErxnEw2nrQw9EjTLNFRd37inyPISijYJ
 Zq8p/ajgULc+3mSGzmZcFMzNYvFsNfi7xnEyz3bON/c7hWNzIkGlbWp8K2FhVjbjJ5i9
 ok2Sud0uIWmhom9FfCdTjdRpP+QQhy0q3xst2VR+PFkK5pxbPE2Heju4oPRC64iLMSrc
 6oS3gWqaPJVFx7Of+esZrxXwd9FAXIQZrSeNdTDUIztaXS38vgGk5G6E9W1xCa3RXpgE
 Gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780569008; x=1781173808;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwKWk7HK8RzvFKOSUN3yns8Atz0EDVuDpIIcb+R3WuU=;
 b=de7jzK15f6nrgt/R2x+QGZMv0McMD6W1MTSOgzjlOAPHaL5UeuGZymKppQpf8iudCI
 wWlgnq6FHiLwikSDTw9f1kj+rwvV9dclnoDOI8qKcXjdwodd8FfOu2KENnJb2A6J/D8K
 WNFDkM6VS1U9qEDMGd8Uwdq6NwIWAp/rJ1ECI5Azv+fJedU8tIOdFSg+yH72wR9LZsj6
 qkxAV9OR+xuUnLbqf6vuSyp3lGnZtmZJ3ncVp/vpMLG3ShIi3kuehoVv0C/z8539BQRg
 kVjCzkU/ytbASi+GanT+7PceZRgMCqrzeV2dR2/XC7QTktmZYpkXRnTAPeNW08kL3/eJ
 JyZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1c0RpcO8n8hENhz/t5rOZYw/Mg8K7fN4v49hrTn6NJtG6f9rp6XDtn/WIezW7LBLNvyvE/W/gYmX3@nongnu.org
X-Gm-Message-State: AOJu0Yzg9Or21nAgfHU4v9Z9DbNONOKWSi6+zRG9xvgKIovcWnN8XVfb
 u+viRk89ypgCy67Pl3P71ELPeoatF3geky7Am0SUqoRCLVIG8bcelm5SNDckAZdzYEvlWH0SSMO
 Ff3ZnPtNzyjcyI6bWfETiFn5vTya1eflryBJ7iOkrac8kVryJwdurI1dtjg==
X-Gm-Gg: Acq92OHaKhW46/KiLmTslITB38k6ozB/3WLzSFq1toX6ISHAnccM+5PwqiAllt2yQVr
 rmHystLcK45g/x2ZmEHc/+lir798IPvwdRJIJiIWxW/vprVnRHLPSxT2bEVaEN/3Z7ICtVk9hfH
 wCtP9lvL2ozAVwarn6bXYOVOfp75Ww1NUBka6cTRRGe1H+rnuO9MTmXs3cg3pNvtnXrEnwpU3U+
 6/mSqVcl6F6tI9HPypYhQ4k+G7DCk3Gs93Q1/8yxWvdqbDaFIaK3BXcpV/KvkPICi0D4AtI+aWc
 XASuyZDLdJF+sesLCBFZJELdlPY6YYDZP/IeupUH6aAaRQSwbGwBZqtYfsHJDoQbgX/Z3yUm9r/
 igam23ey1iyoJYk4IOr4jWlUCd73az71PVPek/2EgUOKTkwkh707J95ocxsdv2HyMi+UC
X-Received: by 2002:a05:690c:4b81:b0:79a:6249:a046 with SMTP id
 00721157ae682-7ea4720ccc5mr62274697b3.9.1780569008129; 
 Thu, 04 Jun 2026 03:30:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4b81:b0:79a:6249:a046 with SMTP id
 00721157ae682-7ea4720ccc5mr62274497b3.9.1780569007678; 
 Thu, 04 Jun 2026 03:30:07 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea2409db52sm31051137b3.44.2026.06.04.03.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:30:07 -0700 (PDT)
Message-ID: <a82746fe-5c7d-4daf-86e2-6a477f55ff3b@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:30:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/25] target/riscv/debug: Fix migration post_load
 icount_enabled() test
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-8-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-8-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMSBTYWx0ZWRfX2s+QR5thNq7h
 Bzc1p1fEv9/na3649R4eX+vu3IieRU31BvisI/dfULzHSKhw+H7zw5ZHmqo3sKTJMsV7N5Gtw8J
 L7KgulZWvYpAWAFMKtP01IuTGM0oIpUUc2XN0diqwlxyefjhwgVIvyG3dLsK1a+B1dvtL3Re6u0
 XGpyJf7trG/keiXU4aLd4y29OpKRApFOG1J38hMz0WPAyZC+CfH0/NuqajHTDAqSVklBRTVtH7k
 9zK2JYD5ALQjcX9uU1xGtIybMr+5X87fMhrrkswQ/cg51C+Hxua9577YjAamiQsqzMZ9xhK1tqp
 2cV95weIfJ0ZArJiprOVpmUFVXC3ST+rjxpyhf/V93+e4nYg9VQVGeebrhahz/i0G0iNJyJqT4z
 eda5pUd2EvRtDMO0wevQQsnrm5Vid7Ktqi/rdafAo9gR1of3AwSnfIOZtMjcFZwpB7qWTCD6afP
 kn12ym9wru6zC7S+Vfw==
X-Proofpoint-ORIG-GUID: cTeLTttt4JXgJwEm4dKbiEXMy4E8FD-x
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a2153b0 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aLERe-55eW_5Fbas3b4A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: cTeLTttt4JXgJwEm4dKbiEXMy4E8FD-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040101
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> itrigger_enabled is relevant to the !icount_enabled() path, the test in
> debug_post_load() is inverted.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/machine.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 09c032a879..34fd73c920 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -230,7 +230,7 @@ static int debug_post_load(void *opaque, int version_id)
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>   
> -    if (icount_enabled()) {
> +    if (!icount_enabled()) {
>           env->itrigger_enabled = riscv_itrigger_enabled(env);
>       }
>   


