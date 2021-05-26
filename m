Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lls3n-0004y3-BN
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 07:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lls3l-0004xC-8x; Wed, 26 May 2021 07:50:49 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lls3i-0002as-20; Wed, 26 May 2021 07:50:48 -0400
Received: by mail-ej1-x62a.google.com with SMTP id z16so1340802ejr.4;
 Wed, 26 May 2021 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QtcrLZGT/Aig81ewY4/KrHqqzykoGq5TDTR9zInUT70=;
 b=lGLW5B5F+cR2E1jzMzsmk+Mc+Ypvj/fCWkqED/RCDCX8X5j82O5NpvsZ+CUzAGSFpn
 lRuslhEwgV8NDTcIj0gFFidFzmE+93mYhJCHgHba838oufBGk3bN2zcVwruYKnLGGxWy
 6qzr5fT+sVHHQ5pAGUohqcANSMIklwMZE98EvUmBLJ9Irnsll7/VrL8dJqeGl8IUc545
 qlBJ/ZH/fxlLTVXV06r+WQEDSSE6P48aw5stkT+FsP3YaatjF4nh1V4p/qBA504p2bQq
 pMIvhEd/DUNaOtffNI7Z3Yh6kYwVFUe2oqqn0vfJZOYqzuXF5Cpoqr2DtA+8YpnGhenn
 Srpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QtcrLZGT/Aig81ewY4/KrHqqzykoGq5TDTR9zInUT70=;
 b=jVIX7UBIhQXPbKnarMJdbjDuagZhso+8uUwJu4ynyhjkpfB9qQFihp1vW7v62onpFu
 JWo6MiiObXHgyTi9JJh3PYfN1xz9KLINgKUM3Q1gSIj1mWgdAgwcI4Jxv1BunwJXgnfX
 c/zmPnctFu5WiKW/0bfXGnG59F8ruFWVdioaXVt7e5fk3sANwoXbit2FBvzd4lBV0ItB
 TmF7Q6BGBwhLp24tJSNBZbBRQarxolog3A2SG/kWjNmf2STjV5Ja8k7Z1vS8XQbWUTik
 X0WsAChAur7SmU08G/RggYsSVbDwB8Qa6jOnHXP7uIuYZpYrTqSl1DnvNkENf+RgwgcF
 gHyw==
X-Gm-Message-State: AOAM531/lu0bKJMLL4XvXkp4HfeK2I+Qsz27DpkV1yX4Ff1hkNA9jvqC
 xJMGKSuSPtbu+hhsWDs/nEaUCYPNuiYDifqjeMg=
X-Google-Smtp-Source: ABdhPJwosjwkydrDDLLwoQG6bnsdjU/59Z1C1YPjluvYNVTudbmFzlBqYH4buL0L3+/I2CPjc1lXB4drq1hQbJ+BmwM=
X-Received: by 2002:a17:906:16d2:: with SMTP id
 t18mr33235160ejd.277.1622029843721; 
 Wed, 26 May 2021 04:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210522154429.361235-1-josemartins90@gmail.com>
 <94455d68-c088-5875-d115-acd95829406e@c-sky.com>
In-Reply-To: <94455d68-c088-5875-d115-acd95829406e@c-sky.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Wed, 26 May 2021 12:50:32 +0100
Message-ID: <CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=josemartins90@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 May 2021 11:50:49 -0000

Hello Zhiwei, thank you for reviewing the patch.

I'll split the patch in a series as you suggest. But first can you
help me understand what the problems are with
riscv_cpu_local_irq_pending?

> I think there are two errors in riscv_cpu_local_irq_pending.
>
> 1) VS interrupts can't be forwarded to hs-mode rightly . It has
> nothing to do with delegate or not in hideleg. The reason is that
> VS interrupts are always discarded when V=3D0 in
> riscv_cpu_local_irq_pending.

I don't see why this is the case. The way I see it, VS interrupts are
only discarded for V=3D0 *iff* they are delegated in mideleg/hideleg.  I
actually tested it and I see the correct forwarding of vs-mode
interrupts to hs-mode. I tested it by running in hs-mode with all the
needed interrupt enables set, the interrupts not delegated in hideleg,
and forcing the trigger of the interrupt by writing hvip. But maybe
there are some corner cases I'm not taking into account. Can you
explain this further? Maybe walk me through an example of when this
issue might occur.

> 2) Use MSTATUS_SIE in mstatus_hs to select pending_hs_irqs.

I don't think you need to go through mstatus_hs to get the correct sie
state. My logic behind this is: env->mstatus will have the vs-level
sie if V=3D1 and hs-level sie if V=3D0. Due to the short-circuiting
property of the logic operators the sie variable will only have an
effect on hsie if V=3D0 and on vsie if V=3D1. So the value of sie is only
used in the correct context.

Again, please correct me if I'm wrong. I might be missing something.

Best,
Jos=C3=A9

