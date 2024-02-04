Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBC1C4828F
	for <qemu-riscv@archiver.kernel.org>; Sun,  4 Feb 2024 06:55:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rWWP2-0006lr-KZ; Sun, 04 Feb 2024 01:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rWWP0-0006l8-VJ
 for qemu-riscv@nongnu.org; Sun, 04 Feb 2024 01:54:55 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rWWOz-0003Va-9G
 for qemu-riscv@nongnu.org; Sun, 04 Feb 2024 01:54:54 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso2975721a12.1
 for <qemu-riscv@nongnu.org>; Sat, 03 Feb 2024 22:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1707029692; x=1707634492;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4vyemOQBKqCRMDoSJGrCEn4NYeSNZ9GcDIzpGzLGJE=;
 b=ioHlGBFHz6sbBwliFPGVjTFv6vr/7DlznkFZmr/E90KrDPxRBb+FaDUd6ZwIGoauHG
 WS+ba34q9d8rwC8hZ+nRJ+IjLX1ZYfIzSTTfOqKDUHTEcBsmS+AAdRvlFJxWV2g/tyyw
 pBprA6f+VmlrQEmFSjFmzFkoO6hfNicZoUH0VVerPQcGp/SQRxeR55Y6hZkZqUyS3/s0
 lTb2CY5BvkONx67j0IpvgRpeo0lQ7OnnUsfLwmVv21yYPbZNgh4Voi+7fbSHifNYrRoj
 YUdfUWMChCne+TiIwzq9bfQhUmyqx6mxrb8rxD7I5r+hCMr+o2IJED2ui32ImPc9RBmv
 ue1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707029692; x=1707634492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4vyemOQBKqCRMDoSJGrCEn4NYeSNZ9GcDIzpGzLGJE=;
 b=As58acV0XqH6TOVSGoZUunt2nJtPzkRQBCKqwzlVzm+OlGwTBV2wCAglI5AO+KE9vJ
 yZgEI0JeU8mCAoRBbIItZxR6Nj8Hk7k6sAOwANKl9MV8tTVptflXMTSMjWDjrRO8ZHdw
 A+kKoSg4QnBCTyJqDFQHGVRyJCjtgbrd16TZ7StkcoHn3RAuAbVMkR69RPopYWum4iKN
 rE+5E9PnZ7dK+JUiMFhL6kvbFhwVN/Y408j9DJZjXM9oP61QMb0t5Imaqih7o9NfL5Yt
 o/0jID41tlvrJ927x31clAux4bam6dn8R/azQ3Pa0uB89FtgH3LgOvruDJ1D2LQISHSy
 4WEQ==
X-Gm-Message-State: AOJu0YyKVlwEmDeyVhScUshJgOoOu3a7tMIUmHwS5mpdxMmynYdxuXFk
 5jbJv9axc5mvB5zu1xYlStwrTE/AETHr5dg/JQ8m7W4z/O0Jy+ZJGpb+zkb+Wls=
X-Google-Smtp-Source: AGHT+IHWsVj9VYhGX2Y65/KgKeyDtfvlHdGGGi7xYxe+Je71/Y/1XZCBHbQUuYRo5xgJmjdCYW8tNQ==
X-Received: by 2002:a17:902:d2c4:b0:1d9:fbe:466e with SMTP id
 n4-20020a170902d2c400b001d90fbe466emr8266916plc.66.1707029691730; 
 Sat, 03 Feb 2024 22:54:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV2bQIFyde5UCJo3VLEdO79O2IQXN9DIXapTu2Tyz93RjXHcneqhazOkMbyXehcB1oY/g6xf4y8cCFL78CCeFrbqs7MzOZsAnSET6DdcrDAbapa4kDuhlm5NudqZOfTkLAFu/FU2StIIm4UfBifHRw21uQN4HuFDCNsxF9Htlco5BBaTEeGu9/NuV3o/IJ6UOZDzU3IjJEUz82dzxIazFQsG07IrQizlRmtvZMypB3JBtNn8PwYIfQ221UrCj8ttgIxm3Stus2raV7mJrEEJqcYLPoQNV6yJqRyYKBb3s0ynyxU5mTDx4h3h8DdHOFGWF7Dh+4eFs3KjbM5Bb6zd628dpwOA/4ODjj1h1XIqqFq6dJ3gTezwKsa5inkgzycGjQWthwAYW1cRHhzXpK4k8+IxqB8UxgaW+xDTBYFcBORWNDk
Received: from [157.82.200.138] ([157.82.200.138])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170902f24300b001d714a1530bsm4131082plc.176.2024.02.03.22.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 22:54:51 -0800 (PST)
Message-ID: <7fae3d1a-5af2-4557-a2b3-13b911e73382@daynix.com>
Date: Sun, 4 Feb 2024 15:54:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] gdbstub and TCG plugin improvements
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20240203-riscv-v11-0-a23f4848a628@daynix.com>
 <87bk8xpzyl.fsf@draig.linaro.org>
 <b34c4013-1aca-466e-b94e-55d9802928b3@daynix.com>
 <87zfwhodit.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87zfwhodit.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2024/02/03 22:58, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/03 20:08, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> This series extracts fixes and refactorings that can be applied
>>>> independently from "[PATCH v9 00/23] plugins: Allow to read registers".
>>>>
>>>> The patch "target/riscv: Move MISA limits to class" was replaced with
>>>> patch "target/riscv: Move misa_mxl_max to class" since I found instances
>>>> may have different misa_ext_mask.
>>> As this is re-based on Alistair's riscv-to-apply.next tree I'll wait
>>> for
>>> this to go through the RiscV trees and then re-base the plugin patches
>>> and dropping the merged riscv patches from my tree.
>>> In the meantime feel free to review:
>>>     Message-Id: <20240122145610.413836-1-alex.bennee@linaro.org>
>>>     Date: Mon, 22 Jan 2024 14:55:49 +0000
>>>     Subject: [PATCH v3 00/21] plugin updates (register access) for 9.0 (pre-PR?)
>>>     From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
>>> For:
>>>     contrib/plugins: extend execlog to track register changes
>>>     gdbstub: expose api to find registers
>>> So I can add this to my maintainer omnibus series for the next PR I
>>> send.
>>
>> I added one trivial comment to: "gdbstub: expose api to find registers"
>>
>> "contrib/plugins: extend execlog to track register changes" depends on
>> "plugins: add an API to read registers". The comments for the patch in
>> the following email are not addressed yet:
>> https://lore.kernel.org/all/4b2156ed-688d-4617-b52d-200413f01156@daynix.com/
> 
> I don't think we need to serialise with the BQL as the structures are
> per-CPU (and created on vCPU creation).

qemu_plugin_get_registers() has vcpu parameter, which can refer to a 
different vcpu the caller is on (or the caller may not be in a vcpu 
context at all).

> 
> As far as the restructuring we can move it into gdbstub later if there
> is a need to. At the moment the structure is just housekeeping for
> plugins.

Certainly we can move it later, but adding the code in the plugin 
infrastructure now won't help in that case.

