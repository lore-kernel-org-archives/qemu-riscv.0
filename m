Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B1CCD11BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 09:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnakj-0001EO-Iq; Fri, 22 Mar 2024 04:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnaki-0001Dt-Dd
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 04:59:52 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnakg-0001sk-S4
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 04:59:52 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1dee27acf7aso12734335ad.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711097989; x=1711702789; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a1vfWWq402ODKpgAEOpkY7cqpUKTrQvZscMmfpRFR7Q=;
 b=DPP4zEMGxRU6GDfWJRAh0helSVoHzDPhmlrhYJZ0niN2U4p6TMpmeFNEUKhXeoUJN/
 wd+Z19aIrUq5+reRKokjMzaj07ZOyKj/bbiIRGtiCzipLj51XaIuC6pUctL4bAWAtPxq
 1TmJnNG8CpV3AMTVSQTFbnSjFMj7K+NSEJptDGMGHQsMr8z1Bu330DZvL99EwKX5GEMV
 +xPFgnq42rG+RVMjphQmU3j5OBDD5VGtPhGCh4Ge4adRbZGStMhQU6sSRWpsdomXrNwc
 40gggHhwuLoLD1rbaJ3of6c92VBvp7+hdDVtbkiW7WwO4m1CUkHxa09s5MKXXlIlfpBn
 7rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711097989; x=1711702789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1vfWWq402ODKpgAEOpkY7cqpUKTrQvZscMmfpRFR7Q=;
 b=EUPQafh+lb2LuNkVgoPp9P4JOrxvXlObjN+8mgL4T5lZS06KNG2PuD+z6GtsVCviEK
 OTdK+MbfLn/70NweWxYpecxmEjGk2V1XYmS4Hes9aCZuiYlyjrQg35LJEgDRCPOahTak
 AX9y2SVigGt48gmqWskqP6sSZmMDOskWUS1NqSzaUS3A18r5Ug2u0WynwVJVpOfspu6D
 4LvTAvU0dNHkuVLJvBUBHh0k9Ni8+3i7IHzdmtxcDYpz6vAgFQnMX84Wo69AZXDczdJ+
 au2UVwtNCM1QIfvwnQBJdrWoeWFrziDj6H0JOS70Q+VYrFvWLfFV+EG6jnnlU9831R3Q
 Bdtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtfC5hAAhD7ts2c6wUAx2PO03x7cDmEg+q4SfPNu/nk79W8oFMmjHmkNTFJ2TCRiAto4gKjlxTXIpshQT3wfFJgaPxb3Q=
X-Gm-Message-State: AOJu0Yw6GrMaDL/5TtPlqU1bKmHnYx99Mpk3XlhgI5AW1OiGxRDS8PSS
 5FWQchyDyVPLtyEFsrhCAsTBWzr4ALR53mv2quj2IIuu2NQFErTjiyxKrKzBuoY=
X-Google-Smtp-Source: AGHT+IF92LtyhLQu6LpObI4fvutoSbNTFhB4dvmwyPKHerXCsoLoomwrACyFPevb6bKn82G9dNyamQ==
X-Received: by 2002:a17:902:f544:b0:1de:e47e:116c with SMTP id
 h4-20020a170902f54400b001dee47e116cmr2494974plf.39.1711097989319; 
 Fri, 22 Mar 2024 01:59:49 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170902d35500b001dc9422891esm1360749plk.30.2024.03.22.01.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 01:59:49 -0700 (PDT)
Message-ID: <699485f0-4c96-4d63-ad09-276e22c65c02@sifive.com>
Date: Fri, 22 Mar 2024 16:59:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix fp16 checking in vector fp widen/narrow instructions
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20240320072709.1043227-1-max.chou@sifive.com>
 <CAKmqyKNN_BbxV-Qh=8gOCpb6z6RS2qmGajj--XU7XgnZ3ks10g@mail.gmail.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <CAKmqyKNN_BbxV-Qh=8gOCpb6z6RS2qmGajj--XU7XgnZ3ks10g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Thanks for the notification.
I'll resend this series and rebase on the riscv-to-apply.next branch.

Max

On 2024/3/22 12:12 PM, Alistair Francis wrote:
> On Wed, Mar 20, 2024 at 5:28 PM Max Chou <max.chou@sifive.com> wrote:
>> When SEW is 16, we need to check whether the Zvfhmin is enabled for the
>> single width operator for vector floating point widen/narrow
>> instructions.
>>
>> The commits in this patchset fix the single width operator checking and
>> remove the redudant SEW checking for vector floating point widen/narrow
>> instructions.
>>
>> Max Chou (4):
>>    target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v and
>>      vfncvt.f.f.w instructions
>>    target/riscv: rvv: Check single width operator for vector fp widen
>>      instructions
>>    target/riscv: rvv: Check single width operator for vfncvt.rod.f.f.w
>>    target/riscv: rvv: Remove redudant SEW checking for vector fp
>>      narrow/widen instructions
> I think something went wrong here. It looks like you meant to send
> this as a series, but somehow that information was lost in the subject
>
> Alistair
>
>>   target/riscv/insn_trans/trans_rvv.c.inc | 42 ++++++++++++++++---------
>>   1 file changed, 28 insertions(+), 14 deletions(-)
>>
>> --
>> 2.31.1
>>
>>

