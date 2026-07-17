Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABC7C4451B
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:09:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkjFV-00059u-EL; Fri, 17 Jul 2026 10:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wkjFT-00057X-IW
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 10:09:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wkjFR-0004ho-Ev
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 10:09:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47db714766aso834608f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784297343; x=1784902143; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=feehZpSqlao23lIspLk0fQHWhNzLDlJiQx9HauxpcYQ=;
 b=mnqA/F3WApHxI3w0E/SYG6EsoFdi3LDbWsik/MOoq3hFO6qJJ/GkDz/xob/31F13JI
 0OLYjcLiELjaGTX7imILdqzcoLmVSsr8paz7UA7KrhDM8JUsfRROe35pZjw+57rGiUyn
 8bDhoYW0Zr0yRqNCWnuwnMmj7AGBuZTggoOX/jNPB/17wO1dnoM+gFbzE9NE3sDb+CkJ
 PpGy53Fl43f1IeSTS8lJSP5Bmx9qAjeViJqob3gcV3EpDSXmsJMUf/Y456wL3V82NCkT
 /Rm/xzAKy7MMXfsX+heHm60U5VXRMgwNmWGteXs6yV0q0YEhn0Tcp0EfK7gARcBV0rNL
 hHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784297343; x=1784902143;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=feehZpSqlao23lIspLk0fQHWhNzLDlJiQx9HauxpcYQ=;
 b=moJ3JsuCSpt8tpgN3jxeCZhwd6t7t2xZIDRE3JIOvGBJBq0yQOY+wZ6MWaLxW8eRfV
 PltuH6aY3IM0XNnKutO1t1AV0O6YtgbQeEM196jOVg4aTTCXCt0BZP2i32s4SOVg3FfP
 BL1/v7zOnTtrar08R0HEvhWkTeXGMUhisXrrby6fd719SfuxnnYaOZRVlylKCJmJrWLf
 c5tCr/p7xNks16vEHWHmW06KLBrIvXdPyT6e7lWRB1dd+z+RmxlrrPg+hj8S9svGFFso
 mAWf2EjSScmaPVaRHqdAoX9hdEfxMMN/7YCI4IrfRYu9u1/WLT+mKlVbddje7ruvOsSQ
 0uEg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXW+tlaW1GsT3xgDSFMbtaN9aaj9h7v9YB/b6xtFKZowkaJJoAaQhTJYnoUGL0kxZ52ErmkQfno69O@nongnu.org
X-Gm-Message-State: AOJu0Yxrou7u6Q1LtrV4vE364Jmy5MwgPZvvOytncwz2+8XngMuh2ucP
 LkxNtcBHgJy+5wo2GcFmzm/HXVReDlfPl03SJadTwBKXMJCBhFg47kOmyow0+wO5N9g=
X-Gm-Gg: AfdE7cltB33SAWj0WN3r28PmrJIHw7CsH2HiJhdh65SQaeBUrew6XOWgwQUvzdT6v4D
 6UELbzKi9cYVtGUxVHEth61vPT3MUhvEyOZy/GDFY+Bu8ofYYvXgzXH1Cds2zuHIJqO+nKmCLit
 yRTe6zDeD1eHOJTlwdnvCVSsGiOPgXET5w7tUaxb2mOR53bVPzK1cR7Ds0TXLzsHnFvAecBQ05p
 mixzZiYqz8AIbjhPztZ6dGLUiii2xaCejQEVG7MOOWGJ0F08Ezeu2kmvuuf1QXCM+loVT1TCS/u
 T6x1JT1cSx/wd7RuxHVy1n31wVwf/XNUFzb0C90gWG+YpCwv73zehFDGULDFDGgVnynZhROv2R3
 NL67o11pY+02708CwOEcFLQEJUxaoJn5gYi20eEStlOmFgHwbo+uNHgbCuqSLr0SXkj5oDYsLEG
 3VqTlHgrmWak27
X-Received: by 2002:a05:6000:4904:b0:475:f0c2:75b2 with SMTP id
 ffacd0b85a97d-47f623f1e84mr3728629f8f.29.1784297343252; 
 Fri, 17 Jul 2026 07:09:03 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7f55sm3825779f8f.18.2026.07.17.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 07:09:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 424A35F7DB;
 Fri, 17 Jul 2026 15:09:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Jim Shu
 <jim.shu@sifive.com>,  Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Peter Xu <peterx@redhat.com>,  David Hildenbrand
 <david@kernel.org>,  =?utf-8?Q?Cl=C3=A9ment?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Zhao Liu
 <zhao1.liu@intel.com>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Cl=C3=A9ment?= Chigot <chigot@adacore.com>,  Frederic Konrad
 <konrad.frederic@yahoo.fr>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
In-Reply-To: <CAFEAcA_q7jtebfD0EFXUh6VOdqMjy0WGo7ZOfvpA3W8p4=tkMA@mail.gmail.com>
 (Peter Maydell's message of "Fri, 17 Jul 2026 12:14:49 +0100")
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <87ik6e2ajn.fsf@draig.linaro.org>
 <CAFEAcA_q7jtebfD0EFXUh6VOdqMjy0WGo7ZOfvpA3W8p4=tkMA@mail.gmail.com>
User-Agent: mu4e 1.14.3-pre1; emacs 30.1
Date: Fri, 17 Jul 2026 15:09:01 +0100
Message-ID: <871pd13dz6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 17 Jul 2026 at 11:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>
>> > On 18/3/26 05:40, Jim Shu wrote:
>> >> On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
>> >> <richard.henderson@linaro.org> wrote:
>> >> ...
>> >>> Hmm.  This really overlaps the secure and space fields from arm, and=
 possibly some of the
>> >>> others as well (e.g. user, requester_id, pid).
>> >>>
>> >>> I don't really have a good suggestion for that right now, but it wou=
ld be nice to not keep
>> >>> expanding the count of these sorts of fields that somehow specify th=
e originator, but
>> >>> clearly cannot overlap.
>> >>>
>> >>> I'm reasonably sure we've had this discussion before, but nothing ha=
s come of it.
>> >>>
>> >>> Time to paint the bikeshed again?
>> >
>> > Last discussion IIRC:
>> > https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2XJYXA=
MTgO3z6q6DHgqkAwRw@mail.gmail.com/
>> >
>> > (see also a suggestion in
>> > https://lore.kernel.org/qemu-devel/Z4+P3eHXqcU4Dqdx@intel.com/)
>>
>> Also somewhat related:
>>
>>   Message-Id: <20221111182535.64844-1-alex.bennee@linaro.org>
>>   Date: Fri, 11 Nov 2022 18:25:15 +0000
>>   Subject: [PATCH for 8.0 v5 00/20] use MemTxAttrs to avoid current_cpu =
in hw/
>>
>> Another case that was mentioned in a Core Collective meeting was
>> handling MMIO devices with IOMMUs (currently requester_id is tied to
>> PCI). I guess the WorldGuard WID field is a similar thing.
>
> The worldguard ID is more like the Arm security space field, as I
> understand it -- it encodes what the request should or should
> not be able to access, and multiple different transaction masters
> might be able to send with the same worldguard ID. A requester_id
> on the other hand is intended to identify a unique sender.
> (In AXI these things turn up in different signals.)
>
> I think the trick with requester_id is that we need to identify
> what we need to encode here and make sure we don't confuse things.
> (e.g. a CPU needs to not be able to emit something that looks like
> a PCI request by accident, because some devices need to be able
> to tell "this really did come from a PCI device" from "this is a
> CPU doing a normal load/store insn"). So we probably want some
> kind of "this is what the requester_id is" enum rather than just
> a convention.

Yeah I had a type:

  /**
   * typedef MemTxRequesterType - source of memory transaction
   *
   * Every memory transaction comes from a specific place which defines
   * how requester_id should be handled if at all.
   *
   * UNSPECIFIED: the default for otherwise undefined MemTxAttrs
   * CPU: requester_id is the global cpu_index
   *      This needs further processing if you need to work out which
   *      socket or complex it comes from
   * PCI: indicates the requester_id is a PCI id
   * MACHINE: indicates a machine specific encoding
   *          This will require further processing to decode into its
   *          constituent parts.
   */
  typedef enum MemTxRequesterType {
      MTRT_UNSPECIFIED =3D 0,
      MTRT_CPU,
      MTRT_PCI,
      MTRT_MACHINE
  } MemTxRequesterType;

  /**
   * typedef MemTxAttrs - attributes of a memory transaction
   *
   * Every memory transaction has associated with it a set of
   * attributes. Some of these are generic (such as the ID of
   * the bus master); some are specific to a particular kind of
   * bus (such as the ARM Secure/NonSecure bit). We define them
   * all as non-overlapping bitfields in a single struct to avoid
   * confusion if different parts of QEMU used the same bit for
   * different semantics.
   */
  typedef struct MemTxAttrs {
      /* Requester type (e.g. CPU or PCI MSI) */
      MemTxRequesterType requester_type:2;
      /* Requester ID */
      unsigned int requester_id:16;
      /*
       * ARM/AMBA: TrustZone Secure access
       * x86: System Management Mode access
       */
      unsigned int secure:1;
      /*
       * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
       * easier to have both fields to assist code that does not understand
       * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
       */
      unsigned int space:2;
      /* Memory access is usermode (unprivileged) */
      unsigned int user:1;
      /*
       * Bus interconnect and peripherals can access anything (memories,
       * devices) by default. By setting the 'memory' bit, bus transaction
       * are restricted to "normal" memories (per the AMBA documentation)
       * versus devices. Access to devices will be logged and rejected
       * (see MEMTX_ACCESS_ERROR).
       */
      unsigned int memory:1;
      /* Debug access that can even write to ROM. */
      unsigned int debug:1;
      /*
       * PID (PCI PASID) support: Limited to 8 bits process identifier.
       */
      unsigned int pid:8;

      /* PCI - IOMMU operations, see PCIAddressType */
      unsigned int address_type:1;

      uint8_t _reserved1;
      uint16_t _reserved2;
  } MemTxAttrs;

But I suspect MTRT_MACHINE might be a bit too much of a blunt
instrument. I never used in my series but the idea is it would call back
to the machine to work out how it interpreted requester_id.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

