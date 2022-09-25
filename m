Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocRzB-00023k-A2
	for mharc-qemu-riscv@gnu.org; Sun, 25 Sep 2022 09:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRz4-00021l-2e
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 09:47:54 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRz1-000183-7D
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 09:47:49 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 l7-20020a056830154700b0065563d564dfso3004662otp.0
 for <qemu-riscv@nongnu.org>; Sun, 25 Sep 2022 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=daxvBsCxUPytPCYWtKVp5AMAXIBmG2NQPPJbSo3BuAA=;
 b=eQAm4cu8TcroygXsdSTn1YiigArlDxf8LHZGfR3w4s/1mraE9qsntyHysT6V+ol9GQ
 NeindJhopcebcl4nEkSVNKFiSVY8trGaW4+uoEYkS/LSUXOKtAknW+N8PeFIvXz1gD6g
 1ykksEKqe3nGhWtAOUfNgcL8NxC/vRJsEFc/5A4pn6w1NXamckBZ6YunOg+2PH+cix8y
 gv1XomE0Nnfj22UjJJjfN9LH4TbbJNzamNAH0pTZPMFRHnJRTDXdi9MqsxoPdQZLA0Pp
 tNRIjhRVTvTohCMHji4ZWV25IRHkXQiRbb/xpGN2WeCR8xC829U9Y3LdgD9+MyRjH/UW
 GeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=daxvBsCxUPytPCYWtKVp5AMAXIBmG2NQPPJbSo3BuAA=;
 b=JnmY50nLsl9WxD5bggQHAIe/YYn2ENIqGiK5caajOKF3ttT8hugjyxje3A9OQymqG3
 SVsKlj2Uy8w4+o28dTM5wbUGfPa7q0K/EVeee9az8TdkegTRq5tM0edP605WmwzQF+F6
 6DYnZ3GBUsvRapx1St4HhkQoge3yqQR814DZN2SxxldbDYaGGN23q6RNhrTQHbX6dUuQ
 pIKM1id7ibzvXccMCvehWZ0SKTlL/9DPbToCc2y3rZLYzZnVdBjmZuMIWhg5V0OPrLF8
 zIBfhZRI4/jVR3ul6EPlKYv6v1h5nC42sdWOntDiFkqWzz9vObIOWi6wFDYJczi8dQIe
 LQHQ==
X-Gm-Message-State: ACrzQf0jn4w+t6fRFY2cL9aadmmba9GYnrFy4PU9Kal6mSNpCscvxv1z
 4HfbVrbmAvkugyudNxXie7oaAEkzpt0gckq7X6gbnw==
X-Google-Smtp-Source: AMsMyM5WJjNImu8ktLvGv+/cBIdL6NNap1Pkz/kGNMc/hYGvdDJzOTgPRnblm19lqPu2ehPeAY0DN366Ifre3CoFraw=
X-Received: by 2002:a9d:7552:0:b0:65c:b57:5ce6 with SMTP id
 b18-20020a9d7552000000b0065c0b575ce6mr2882031otl.20.1664113665814; Sun, 25
 Sep 2022 06:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
 <20220905131544.2xlaycrcyviufo5y@kamzik>
 <CAB88-qPOGVksP1ekqTjcGHbi2_iVzsW-b9wokgREEQJ8LgfU=Q@mail.gmail.com>
In-Reply-To: <CAB88-qPOGVksP1ekqTjcGHbi2_iVzsW-b9wokgREEQJ8LgfU=Q@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Sun, 25 Sep 2022 21:47:34 +0800
Message-ID: <CALw707oeRt4+C9HTbzzt0RcP-FtYeh1vTh7meGY99vKQQnsktA@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: Tyler Ng <tkng@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=jim.shu@sifive.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Sun, 25 Sep 2022 13:47:55 -0000

Hi Tyler,

This fix is incorrect.

In PLIC spec, Interrupt Source Priority Memory Map is
0x000000: Reserved (interrupt source 0 does not exist)
0x000004: Interrupt source 1 priority
0x000008: Interrupt source 2 priority

Current RISC-V machines (virt, sifive_u) use 0x4 as priority_base, so
current formula "irq = ((addr - plic->priority_base) >> 2) + 1" will
take offset 0x4 as IRQ source 1, which is correct.
Your fix will cause the bug in existing machines.

Thanks,
Jim Shu




On Tue, Sep 6, 2022 at 11:21 PM Tyler Ng <tkng@rivosinc.com> wrote:
>
> Here's the patch SHA that introduced the offset: 0feb4a7129eb4f120c75849ddc9e50495c50cb63
>
> -Tyler
>
> On Mon, Sep 5, 2022 at 6:15 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:
>> > Fixes a bug in which the index of the interrupt priority is off by 1.
>> > For example, using an IRQ number of 3 with a priority of 1 is supposed to set
>> > plic->source_priority[2] = 1, but instead it sets
>> > plic->source_priority[3] = 1. When an interrupt is claimed to be
>> > serviced, it checks the index 2 instead of 3.
>> >
>> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
>>
>> Fixes tag?
>>
>> Thanks,
>> drew
>>
>> > ---
>> >  hw/intc/sifive_plic.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
>> > index af4ae3630e..e75c47300a 100644
>> > --- a/hw/intc/sifive_plic.c
>> > +++ b/hw/intc/sifive_plic.c
>> > @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
>> > addr, uint64_t value,
>> >      SiFivePLICState *plic = opaque;
>> >
>> >      if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
>> > -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
>> >
>> >          plic->source_priority[irq] = value & 7;
>> >          sifive_plic_update(plic);
>> > --
>> > 2.30.2
>> >

