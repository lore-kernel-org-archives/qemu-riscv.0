Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED9EEB580
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 14:46:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qezDS-0007hG-H5; Sat, 09 Sep 2023 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qezDR-0007h0-C5
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 10:45:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qezDN-0007aj-Md
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 10:45:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c34c9cc9b9so22279255ad.3
 for <qemu-riscv@nongnu.org>; Sat, 09 Sep 2023 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694270735; x=1694875535;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=fHWUFP87ZLuSzjEVbbDQ0m6WgnDWRLhKrDRdZuJlQ3s=;
 b=e04EseKoa+UTcwNyawmOc1AFAd5URCFkNKkJ7u3VzD9++MPJGFG57NkqEa12WlcQj+
 TeWGYy/KHi4tcdnKcc2Z5bM7Iseujppe5YI2XGh53Fv2XGc6jAvLnwaF2pvfoFurtmhH
 t81RSob1P+JznAd87t4fC+RPpMP885jM+h6OIhXZ42HEcGNd6pvAXS8Fo2+JCSHjVoVN
 1gSF2hC4LMmnjgDDTM8qPWxOd8D17xphVCO+XvNwCONkqq9CKXXpU0HI+HjU0IypuLVh
 q98oNZTe3tm2RZ1G1fW3X9cX1k8+vZBZfdqbuKF1RDXfDsCXThNndinSw5WvbwViBI1i
 Cjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694270735; x=1694875535;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHWUFP87ZLuSzjEVbbDQ0m6WgnDWRLhKrDRdZuJlQ3s=;
 b=YDHXBDLJ1VHRZT11o6sgawCHOmQYVMAhQcI64f2Ti264UL3cicl2VE3K1b6j5xjDcy
 I0oapOsPYONHAc0MzeLmAimVr/wXEhrRKAh49/aifCXE+kxUY/iBK/HUyxiKCQvQx5OL
 Ae24Yta1INv78PYa/C6aw7EGKEZSwXrynbICgZDYhsyEhIlW2q1seUi8SrsLrjHbiDBk
 jlkAP8Y1CJj+LKZEQJZQlen3ZUt00gdxLOHP0GKAiU339lGquueqRektnBQddeV88AYN
 CITFhdxQqvGER5TwThfsDTEU1A9m1HHR66UyUZ0mAx5l1IZM33EEieCsZnB8ZMiiU6fL
 DH+A==
X-Gm-Message-State: AOJu0YzsbnKzh2dNmoD6YdgVGRiw+Z/TFxzVrxvzts10hlWd9eyu/5jS
 WO9y4ZW5fy568tV7aq0R2iLzJA==
X-Google-Smtp-Source: AGHT+IEYiCBxx8fIQBX56DpfbMwy3q4rlFLeyMDG2IeceGfhKnn3nsAOxArAVZoB9FGeRUYDHfgRpg==
X-Received: by 2002:a17:902:ea85:b0:1c1:fbec:bc1c with SMTP id
 x5-20020a170902ea8500b001c1fbecbc1cmr4928677plb.42.1694270735373; 
 Sat, 09 Sep 2023 07:45:35 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 o3-20020a170902bcc300b001bdcafcf8d3sm3340154pls.69.2023.09.09.07.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 07:45:34 -0700 (PDT)
Date: Sat, 09 Sep 2023 07:45:34 -0700 (PDT)
X-Google-Original-Date: Sat, 09 Sep 2023 07:45:32 PDT (-0700)
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
In-Reply-To: <CABgObfa9EehjW=p3mA-qiC8_tmkoYCT4SwF5Vtf+710OvSEw3g@mail.gmail.com>
CC: atishp@atishpatra.org, zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, lzw194868@alibaba-inc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pbonzini@redhat.com
Message-ID: <mhng-87182386-83b7-4ce7-af3d-f0cc10b292f8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, 09 Sep 2023 00:18:02 PDT (-0700), pbonzini@redhat.com wrote:
> Il sab 9 set 2023, 03:35 Atish Patra <atishp@atishpatra.org> ha scritto:
>
>> On Fri, Sep 8, 2023 at 3:29 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> >
>> > Queued, thanks.
>> >
>>
>> I didn't realize it was already queued. Gmail threads failed me this time.
>> @Paolo Bonzini : Can you please drop this one as this will break as
>> soon as the host riscv system
>> has the latest kernel ? I have provided more details in the original
>> thread.
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01941.html
>
>
> If you have dynamic clock adjustment, does rdcycle increase with a fixed
> frequency or does it provide the raw number of clock cycles? If the latter,
> I agree that it should be provided by perf; but if the frequency is fixed
> then it would be the same as rdtsc on Intel.

That really depends on exactly how the system is set up, but there are 
systems for which the rdcycle frequency changes when clock speeds change 
and thus will produce surprising answers for users trying to use rdcycle 
as a RTC.  We have rdtime for that, but it has other problems (it's 
trapped and emulated in M-mode on some systems, so it's slow and noisy).

So we're steering folks towards perf where we can, as at least that way 
we've got a higher-level interface we can use to describe these quirks.

>
> Paolo
>
>
>>
>> > Paolo
>> >
>> >
>>
>>
>> --
>> Regards,
>> Atish
>>
>>

