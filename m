Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGiBe-0006Jq-W3
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 10:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGiBG-0006GL-2n; Wed, 27 Jul 2022 10:38:37 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGiB5-0006DL-BR; Wed, 27 Jul 2022 10:38:33 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id i7so13031041qvr.8;
 Wed, 27 Jul 2022 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxIA/PHpEdtnotfWlvZummFGqx6TwbUW8xxbXNPOtLg=;
 b=V9bcy74qOwsxDJ6n1pX/ipVr1EnDJldeJDO/VEMPEqBKKQGPY4OxyybkH2IE8qTe7T
 Bd1xXJGhdpIMT//7BElqiPKUtDvMqFKBWZaY92SzBjxNpeqtfKC34WxoJ6Sr0oftz3Tt
 8mSH1QzoRoffU8512d4BxpYJY22pAlReqUmjfkjAZh+9l1+x/GXdzbiUxzbnNTUspVNW
 /8Jbs5zl39VcipuYXGQZHC87+7QYa1Djaw/09mKNRye9Q7qITLp7RHJADUM7utjiF93t
 UX2L2ZJ0414IOq5YhzYrJYYkGkhRxjQXSMo6yROX7AE2tQbUZigo3mSyAw7jcSEMbAaD
 rA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxIA/PHpEdtnotfWlvZummFGqx6TwbUW8xxbXNPOtLg=;
 b=7lGWWMSaOyZ8ObZy5KR8qlaBcii4fy3JQWJiACymoAIcHaQHAnt1RYklu9IHKcysGF
 g3SVACBHo3ntLrqulTO0gQUD3tAxAAwOFzrWr7IVBLlEqPBVKIdfunBGkWdjRFFPbi5c
 aZ3H808bAHIfiam0URNZTVOnyILnLhuF+b4YnSI3BRdrrW9xoMe+gQ17/ZJEVShjIpm7
 eltUcCS/veGixFoiHq5KR4yVlGFKH2oJ/jaBw3tpfhUYJ6a4pJ8SjEifMF4eCjcNLms2
 fyONnhi5EcDVzTLiCl1XClxGOLN1DW+YsU2E1BR2NAJG4miCX+hLXviaoulxMdXTX4dn
 U6hg==
X-Gm-Message-State: AJIora/NsnXNMVU7buwMrS3rOHKXNmsDmLZZve/PRsOfw9GBIVBAwYWf
 zf/MUbbs2p2FRQ/i1GkcgUATjo737jL9tZtPw6A=
X-Google-Smtp-Source: AGRyM1sTrt0OwWeVc/Vm42sNvvcqHd22tc2BqIcM+/P0iNrx592+eESDGa6wHQEaAwcmlJiJg9ZhsE0g8gzbHPu8Jl0=
X-Received: by 2002:a05:6214:1bca:b0:474:4a5:6ba8 with SMTP id
 m10-20020a0562141bca00b0047404a56ba8mr19367749qvc.114.1658932701660; Wed, 27
 Jul 2022 07:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
In-Reply-To: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 22:38:10 +0800
Message-ID: <CAEUhbmU_3+-A8vAnnCmZ_qYaWv=0QFjkMeBwH+sZ60t+ivHGFw@mail.gmail.com>
Subject: Re: fu740 target
To: Ben Dooks <qemu@ben.fluff.org>, Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 14:38:45 -0000

On Wed, Jul 27, 2022 at 10:24 PM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Is anyone working on adding a sifive-u74 core to the list of supported
> CPU types? I was looking at full emulation of the Unmatched but at the
> moment the best we have is sifive-u54 and I think that misses at least
> two CSRs the sifive-u74 has.
>
> Does anyone have plans to add the sifive-u74, and if not, would a plan
> to add gradual support for it like adding CSRs 0x7c1 and 0x7c2 so we
> can run an Unmatched U-boot SPL against it.

Adding 0x7c1/7c2 would be a vendor-specific CSR approach?

>
> If not, is there a definitive U54->U74 set of public differnces around
> we could use to start from? I'd like to be able to run a full Unmatched
> image using qemu at some point to add to the current real-board testing
> we're doing.
>
> (I have a basic addition of the type and the two CSRs as a couple of
> patches if that would help as a start)
>

I am not aware of anyone doing U74 modeling in QEMU, but SiFive folks
(+Frank) may have one downstream as I see they posted several bug
fixes in the existing U54 model.

Regards,
Bin

