Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZauz-0000jd-G4
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 12:11:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nZaur-0000hO-3t
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 12:11:26 -0400
Received: from [2607:f8b0:4864:20::1036] (port=39683
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nZauo-0000yZ-4K
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 12:11:24 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so244416pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jw7wT6++jG0iz2NYVWCZLA1Um2pypbGlGwKkqDs58aU=;
 b=0oWfoiUP44lDLbxEP3vCm2yZf+Femrimg3Hcnv0Zv3wsZPplKsf25BXDe5JQmtZkZ/
 cMAmv7nzR+TsMDc8lxphKa3rrsj9qVRJf8x45+0Iv69svWD38tCCAL4hcxwD2ML0SYad
 MFLYiLwUOz1yPeRL/0mbfzaQMZzhHefwMvcxgSJxra7QdBlklvszodbZqLw/c6NYwRz7
 ycFHQy9yyNMXYcBY4wpsV7P3b8Crn8pYH4fD7wHYChEVCmwf5s4QN8wLpNqpTYB0qJZF
 4AGOnYhKuinCCLE9T9Tlt7pbzvD5fkISwLfAmsOmUNlXVf3xgCyArXRnDbCRCxjmUcAD
 MzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jw7wT6++jG0iz2NYVWCZLA1Um2pypbGlGwKkqDs58aU=;
 b=CX5TyHQFojdgauN2D2zDz6A6He33R+bL6Pflnl0wy2aHhGgh0BH1Cik9p9qeTzx+Ct
 lCr9ilHsjX/egLVsrAvU41jiRtXSo7sQ6UMLczgnfnFtsbsnclhCkIhS7Kw9+bh0zRWH
 JFIfNwOnr4WOH5ufGdXPoSP+R3uyPE6iDCAI6kLXJ2+WjQ7qCS+d/Sbp/YHzeyCjTyl+
 0TEgXAXkX8l3HrYflGGOUxSZbfQipiQIyg7B7QN+WXcN+y+CSzPZGWtfikYao2oiQINY
 xpr0NVpHkBcFEEGMDl9HHhSSP+wPuyrzRqgIo91N0vrpiy0McUGP4P7u7pWtE2dIqvbE
 2ybQ==
X-Gm-Message-State: AOAM533C/c9cIcIgi47jvr4uVJVe+XutNLTMIY/G99AAMYZfeZafijD0
 TLpaPspQ7xSqTiMx2YM1MaewdA==
X-Google-Smtp-Source: ABdhPJwjLN1XHU4mev5VprJICApjc1bKOpgi66n37g9iNM0PrIs/f57WwIFPnyTpB+Wg+d7zJOU4hw==
X-Received: by 2002:a17:902:a413:b0:156:15b:524a with SMTP id
 p19-20020a170902a41300b00156015b524amr355671plq.106.1648656678681; 
 Wed, 30 Mar 2022 09:11:18 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 y14-20020a056a001c8e00b004fa829db45csm21273726pfw.218.2022.03.30.09.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 09:11:18 -0700 (PDT)
Date: Wed, 30 Mar 2022 09:11:18 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 09:11:15 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
CC: idan.horowitz@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: phantom@zju.edu.cn,         linux-riscv@lists.infradead.org
Message-ID: <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 16:11:26 -0000

[re-ordering the top post]

+linux-riscv, as this may very well be a kernel bug

On Wed, 30 Mar 2022 05:38:30 PDT (-0700), phantom@zju.edu.cn wrote:
>> -----Original Messages-----
>> From: "Idan Horowitz" <idan.horowitz@gmail.com>
>> Sent Time: 2022-03-30 15:35:19 (Wednesday)
>> To: "Atish Patra" <atishp@atishpatra.org>
>> Cc: phantom@zju.edu.cn, "open list:RISC-V" <qemu-riscv@nongnu.org>, "Alistair Francis" <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
>> Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
>> 
>> On Wed, 30 Mar 2022 at 10:28, Atish Patra <atishp@atishpatra.org> wrote:
>> >
>> > I tested on v5.17 built from defconfig for rv64.
>> >
>> > Here is the kernel code executing sfence.vma
>> > https://elixir.bootlin.com/linux/v5.17/source/arch/riscv/kernel/head.S#L122
>> >
>> 
>> I believe this is a kernel bug and not a QEMU one. They perform a
>> write to the SATP with the same ASID as the one used before (0) and

I seem to remember ASID 0 being a special one, with some global-ness, 
but I couldn't find that in a quick poke into the spec.  As below, I'm 
going to read through this a bit more...

(Also, I haven't had any coffee yet)

>> then expect it to be used, without performing an sfence.vma following
>> it.
>> This was exposed by my change, as previously the write to the satp was
>> performed in the same TB block as the sfence.vma *before it*, which
>> meant the TLB was not filled in between the previous sfence and the
>> write to SATP following it.
>> I was able to reproduce the issue with the Fedora Rawhide image in the
>> wiki, and I was able to resolve it by artificially forcing a TLB flush
>> following all writes to SATP.
>> I think the correct course of action here is to:
>> 1. Report the issue to the linux kernel mailing list and/or contribute
>> a patch that adds said missing sfence.vma following the SATP write.
>> (Atish: Are you able to test if adding an sfence.vma in your kernel
>> build fixes the issue?)

If it's a kernel bug we should fix it, but I'm not entirely convinced 
that's the case.  I can confirm that the following makes Linux boot 
again

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index ec07f991866a..83373c2bd7d0 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -121,6 +121,7 @@ relocate:
        or a0, a0, a1
        sfence.vma
        csrw CSR_SATP, a0
+       sfence.vma
 .align 2
 1:
        /* Set trap vector to spin forever to help debug */

It's been a while since I read through the rules here so I'm going to go 
read them again, but IIRC that shouldn't be necessary: that first 
sfence.vma should be sufficiently global to ensure all prior writes to 
the page tables are visible, regardless of what's in SATP.  That said, I 
remember there being a lot of subtly here in the spec wording so I'm 
going to go read the spec again.

>> 2. Restore the patch

Presumably you mean "revert" here?  That might be the right way to go, 
just to avoid breaking users (even if we fix the kernel bug, it'll take 
a while to get everyone to update).  That said, this smells like the 
sort of thing that's going to crop up at arbitrary times in dynamic 
systems so while a revert looks like it'd work around the boot issue we 
might be making more headaches for folks down the road.

> I agree with you partly, my test case is actually from linux kernel, I notice 
> the strange sfence.vma before write satp during write our teaching kernel.
> I think, the strange code is used to bypass the qemu bug that Idan patched.
> Because in hardware, if the stap is empty, sfence.vma will do nothing.
> And that's why nobody report it.

IIUC the sfence.vma before the SATP write is very explicitly necessary: 
without that fence old mappings could be utilized directly after the 
SATP write, so we might not even be able to fetch the next instruction.

> Before patch, qemu won't end a BB after sfence (but jump and CSR write do).
> So, the kernel author reodered write stap and sfence.vma to make sfence.vma 
> place in the same BB with write satp, instead of the following write stvec.
> (If don't reorder, sfence.vma will place in the same BB with write stvec,
> that will crash kernel, see my origin analysis).
>
> However, in hardware, since tlb is empty, put the first sfence.vma before or 
> after write satp is not really matters.
> In qemu, as Atish's log shown, we should do a imply invisible sfence.vma after
> write stap to invalid qemu's translation cache.

The ISA manual is quite explicit about SATP not enforcing these 
orderings.  If what I remember about ASID 0 is true then I do think we'd 
need one, though, to avoid the aliasing -- hopefully I'll make a bit 
more sense soon, though...

