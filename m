Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC00CCF2C1
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 13:57:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHiQO-0004Po-62; Fri, 16 Oct 2026 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHiQI-0004ON-Ju
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 09:56:40 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHiQF-0003gq-Gx
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 09:56:38 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8ac4806e210so48361177b3.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 06:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158994; cv=none;
 d=google.com; s=arc-20260327;
 b=GWSwSmyntKRSxeuO2Nl4dDhs33nFZYC3SDWcGaunxzLkNyLnCq1N/22CUxOkrFPyMo
 Rw0ZGnTjnUVehY+BEXBu/qSksf2waTtPoe4I/DhFZZKzlz6SHCSiEsjOpPqpfTbU5guU
 Bm5fBwDREx/36DheqrZDrx2EEkQe3UuheIUh//5/ITS0rXuZsDxb9sskvTv/7//0JnAQ
 pmZfaFdNC0SDutBN4VeBYuMWBiyJD8h0Lva3tNGKDCjHtfiv/M/DXbhUmXXO0qfLookg
 Wr2xprzu8Y3Sv9f6X4/iWnDTTXadIMCD3+XZ1xF0rSgKvk22opDdM5zWWULezHrZ1klK
 FRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 fh=/UHyZht4nPgvr40LoNeof84sJLcTrpJB7ZZxoEbpBTw=;
 b=sSm51k+Fj8AUzP3GWY3NhUpYnwiVu9r6egkYgj8xk+pcT5VcDc8Spla1IfTasXEyh8
 4VjTbjXp3nFt5p4xB+PC0fvZEwxYTiHT0T23mbT4TkTB3fXdqR2Wle665eQf2l77+Urd
 YtRQ9O61Jcm/Y8ZdrdY9mev8/yjPGbGOp+izK659rYZ1gNoVJV+j2cxn/lLz0pPgnHaH
 C5hyryp2p8FYvh7UwDN0lmW/Q3/bDKX9HP7Nmy4YmzL/dTbrPejsvDsYrCUc0aVLjYdo
 LSm8QxQXwdpE2PxEMbCqXXVBPA885HDK2JDn/LhFEnGBkgZHmNnpmc53Pi3O4sUI/k7Y
 soBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792158994; x=1792763794; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 b=Q0+vhXY3Rt+RY+oJUxClce2ZGfVQZyYPR3az6zu0zYL6bREHbf9XpeGcRv/GJOEvPd
 TSqheX1kuC/I+L54FTjjKbEIJ+sttI8j5DRjuqR9SX419XqyjF4ORu5VpCI0TZeq7N1I
 U1+mfu1g9NSSm9cf3qb9/FFIPq29YEI48xm5vGn+81MHIoSnToYmsmvMc9cmHK7CzlZn
 r+8pp4bFAQae+V+aMj/iAKYJk0WC4LwNmt/xMbfV/FqxVbTSUdNUyMQbG9a9J1oi+zsX
 ErQfC/GZvsHLoCxktFFZyp1Zf4XPZ7d6/0BsIEiEClURShqMOobh0nHlst2E+nH3yAMU
 87ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792158994; x=1792763794;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 b=Mtto+Dj1/nj5nb+FKCkPPEYknY7U6djzM6s79D6+5LUfly7kt4gJ49HoYUrO7K+cT5
 R9tXMXk4VQwIm4Nn+7b1TeVlT/I/++JgahsfJU2kyLSMIvNtNV/QFu3XZaBnueiy4vy1
 NcV9o8f1hAnD/gIG69jjoX4wxjFI0+5vWuqIjO2EJUnaKRby5y6UxVZOrvB3hPuGWbtn
 n9nA91I60x19LhR8zAtHuHp7npTbpXnKs//Twl2JzmXSu5T1/nvIdudoB5S+chri3+Sz
 0z/1ahGqvUpo1Eq44ITFUX+Q9dE9tth5CA3AY1cYtoVx/bMZxOwZrFV2IxDBtaMVgzQ5
 3D5g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjqOBWVfpW1kPvUqBbIr35GemWOkXkdSg3SxrbdT+QnUbyJomfH9IAOb34akZkXUCPXkbHPZSH+dD6@nongnu.org
X-Gm-Message-State: AFq9FYIbJaZzJhZuYiXz1yynotPOl+9CSDP9WDHDRoLCUPvhkelGyc0M
 /3/umVdFfbmvXCd315mvJiVOx2CfHFLQLx7sjqF59VoE04bYGtsAgXzeWMchgWcEyGNdJ8NVBD7
 fpObFZ5I+IpErdlU8xXh4yZEvKMhpwzgRvpSiaUOaNA==
X-Gm-Gg: AYBFou2K9+v6kjVFhrZhhhhO0SDx8n+6fT4D2vPZ+GaVb9OEPw9HY7mUw/75y/xb9eG
 w3TLAAdUIsaAsFw50pHLmKrq8X8NtoCUy6qoKCPWycNrHRwJ3Bi8xYEdzlutefD+gT3IAweq9kK
 d/0M/hBaHyJ0HLw577skgcj4XFdnUPIA7vQH8jNk2Ei2jhCNGclGCgBDUx46Vqf24tj8EYbXu/n
 W8zVkZPcyHLEVWF8gMfakfpgvkKXIFedf4TVRqP824qQsb7b3y8E/HiJCG79yxzS7LqOUvT9qM+
 Dfc3rj9hD70x6ebuyN37WcugK6r4s9WG9jhCUwvGW5aH+RveXhc9D+rDGMGYTaWiRi8Z35cYRG8
 x/BhQji61UBo8MamTCQHx7HRG69jtWAmuOR02gKk=
X-Received: by 2002:a05:690c:e641:b0:8ab:48c5:cbce with SMTP id
 00721157ae682-8b0f217d65fmr71687b3.32.1792158994114; Fri, 16 Oct 2026
 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
 <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
 <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
In-Reply-To: <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 14:56:22 +0100
X-Gm-Features: AclHuK8ssUU6FVTl6l9wX-3cDpH8rijJrXQJT0ZI9oWF2AtJ-fysQFU920oTZ_w
Message-ID: <CAFEAcA-mii9S1NvhKOt=pMha6-OQKheYj7FuMaDVbV2Eoi-3bQ@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: luoyonggang@gmail.com, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Eric Farman <farman@linux.ibm.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
 Xianglai Li <lixianglai@loongson.cn>, Chao Liu <chao.liu@processmission.com>, 
 qemu-s390x@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 16 Oct 2026 at 14:51, Brian Cain <brian.cain@oss.qualcomm.com> wrot=
e:
>
>
> On 10/15/2026 4:38 AM, Yonggang Luo wrote:
> > On Thu, Oct 15, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> >> On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wro=
te:
> >>> Put query-cpu-definitions, dump notes, monitor, and Angel semihosting=
 on
> >>> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> >>> Keep the table in target-ops.c and with a stub
> >>>
> >>> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> >>>    can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> >>> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> >>> - Drop stubs/qmp-cpu.c
> >>>         stubs/hmp-cmd-info_tlb.c
> >>>         stubs/hmp-cmd-info_mem.c
> >>>         stubs/dump.c
> >>>
> >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>

> >> Too big a patch touching stuff all over the place with
> >> insufficient explanation of what it's doing or why.
> > Oh, sorry, I post is just for demo(DRAFT) for other place to
> > reference, but git-publish have no way
> > to title it(maybe because I use it wrongly).
>
> git publish has `--subject-prefix=3DPREFIX` - that will let you qualify
> this as DRAFT/RFC.

It's also helpful to edit the commit message for a single-patch
RFC so it's clear about the purpose of posting it (or to provide
a suitable cover letter on a multi-patch RFC). "Just a draft
to go with this other discussion" is totally fine, as long as
the commit message says so. (More generally, an RFC should say
what you are asking for comments about :-))

thanks
-- PMM

