Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662ADCD5BD5
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 20:06:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgzd-0007no-Is; Thu, 28 May 2026 16:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgzS-0007io-SN
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 16:06:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgzN-0005dK-9o
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 16:06:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so54780705e9.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779998755; x=1780603555; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MfiIvzTFmrEkcL1uOiqJl4DJ3Tk+9nPLLzk58DgkAWc=;
 b=uQRpU+tvcbYEPqEz0y0VpigwMSOtlRR8ADYN+hDNkHsE9qdUn+9/nkgB4jXFr5a63F
 0g/4rnRJp0IAiOY3oV/MtcFHcrrrkCOGDnUwZjthDh1IPnyRxP1YL3iajWBkzN97t+tm
 Mq9wZN8jqWY8QL6fcgNSZ3vOZuLGvUZqBtU8Xg6YUaW84KtOryR0UgOjgnfLGnpdMj9M
 PaWcBVphjj4FwVoJqEz+Tnd5ew9GmCA43MahuArPAMsGHBE8SWUACx22jyrZlzXDQVXd
 aGN972jd+0VzzVBPOE/30i9xr8EeXPTr+Wg+XoqWgqcaji2W6PoAWLNb+bndGEfuVxFc
 j24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779998755; x=1780603555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfiIvzTFmrEkcL1uOiqJl4DJ3Tk+9nPLLzk58DgkAWc=;
 b=Fts5SFqtzoTdZZKLwBJT5cOSY8IQD8fE3gwl/LMUaSVTFQyQ8ybwnOYx8Xnnjqiqy+
 57JeYTVQAy3ZFwF5q+IhXCaXRWiGjvWsorZ5tVlOGrakpiFfBfhYF+PhVVJ9OD161JEo
 2oIqaxnMvb206SdhmCnig9W9pIihYyTjBezi6i8atcouO0/Wcvu/kNeRIW8+QdHiWnbc
 dbG0jEkWCozdYwg6mkIvIQeosvcOHuJwSEzX9m0yJzAUBINdldg9oUlWQ2WpgLFV+fdz
 Dn44dEbMmAoU5G/yj2o+D6OVStNn9CKFwQFG4FACEQ9BLfPxE7NJsY3xtHQWW5mFn4lG
 OEjw==
X-Gm-Message-State: AOJu0Yy4N99CzkHuE7fCBXJNAB6kYFmibZBqwmoaWdcg1rorQePiK8EG
 X5KrTnDnh1DWp87aD1DSU0MqvZZLrAIzYf5r+XROGIh+n5WPX2rpyAZ38k9V/cip1zk=
X-Gm-Gg: Acq92OHUVMi0bvjHalcRE6IU3aKmwYgbvH2dazDQIQVERtJVg4WLAxKN4cwl/JHn/nT
 vnvJIdlTRIklwqlyc4do5YUGjJuJF8Z3BJ8ICC7TAowpk34bx6E9nao8BeDvWFXxC7VSWETcepS
 7iV7V++1bz1W/vyVbtcoCLVPVCDM3ZPuHin2dIo/s/iVQxWfllRviMIH2oNSPchrSKWdj3PntuN
 f4zU0ec1f7FVTqFCSj7xyCOb1AoSfVHDY/QnAuGznzGU3deLwFTnu3F7edgGSk16zzHmaOj1HH+
 OEGZDXaQSzE4EIuLZzJFG23mTsVIpHeoXYtxqq39/nd3AkwDeRnRoFDy9jb7Cd4qJIHNw3SEO3P
 Cj9+1NrvBzChWyNcfe3tUK5EJPQK/7jeMnA9SBF0raozUhveqyX7mEMFL+mjrS2zjLJMzvTdZpQ
 jLw21tDJHvkDgVnK3oo+MJh/FyUL3P77mUjxE/rGXJ1XuTxzKeOAQVP5cCX3V/Al650TcRs6uuB
 KQp
X-Received: by 2002:a7b:cb48:0:b0:490:51e2:bc86 with SMTP id
 5b1f17b1804b1-4909bfced80mr960615e9.23.1779998755230; 
 Thu, 28 May 2026 13:05:55 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909294cb81sm53562795e9.12.2026.05.28.13.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 13:05:53 -0700 (PDT)
Message-ID: <d363d6fd-4c6b-42f6-b7d3-fe43e5e7d64a@linaro.org>
Date: Thu, 28 May 2026 22:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/12] hw/riscv/boot: Replace cpu_to_le32() ->
 const_le32()
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic
 <Djordje.Todorovic@htecgroup.com>, Anton Johansson <anjo@rev.ng>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-9-philmd@linaro.org>
 <9d0853dd-5c22-4c46-9c42-a76d18230271@oss.qualcomm.com>
 <e636c43a-a613-4819-a272-61fef832627c@linaro.org>
 <595550a6-7efa-4e6b-b025-ae1253a029ed@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <595550a6-7efa-4e6b-b025-ae1253a029ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 28/5/26 22:01, Pierrick Bouvier wrote:
> On 5/28/2026 12:56 PM, Philippe Mathieu-Daudé wrote:
>> On 28/5/26 21:40, Pierrick Bouvier wrote:
>>> On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
>>>> Rather than adapting the array endianness when it it
>>>> filled, directly initialize the CODE words with the
>>>> correct endianness.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/riscv/boot.c | 30 +++++++++++++-----------------
>>>>    1 file changed, 13 insertions(+), 17 deletions(-)
>>>>
>>>
>>> One could argue original version is more readable.
>>> Any specific reason for rewriting things this way (performance, personal
>>> preference, other)?
>>> Not a blocker, just want to understand the original motivation.
>>
>> Looking at the following changes, I think it makes more sense to
>> have the CODE section const little-endian, while the DATA section
>> is swapped. Otherwise we'd need 2 distinct loops.
>>
> 
> In this case, having two distinct arrays, and two distinct loops might
> be more clear IMHO.
> The function is called only once, we can afford this.

This was my first approach until I realized this array is
registered with rom_add_blob_fixed_as().

We could register 2 distincts arrays, mrom.reset.code and
mrom.reset.rodata. Now than the patch is written & reviewed,
it sure it is worth it.

