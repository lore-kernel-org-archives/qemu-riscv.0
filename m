Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcGMT-00014d-Vx
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcGMR-000141-Dd; Sun, 17 Oct 2021 20:18:39 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcGMN-0000SN-D4; Sun, 17 Oct 2021 20:18:39 -0400
Received: by mail-io1-xd2e.google.com with SMTP id s17so14189002ioa.13;
 Sun, 17 Oct 2021 17:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7K9Peqvg53wE8szsSzfSVlmz81/WbwRCQEOpbLBbC0=;
 b=QnOvi2n7zms5suZ/TAENu4i418ZKDWL/6QnZyvsL3wCH4iE0XcqUI6+If5RNhjQX+e
 45U22RXqFlyn4XXbk1oO6VNxruPucFsSMqN3X6BGqbDBtIjLyY8FVirXbrWSVkVW/ZIP
 Vcv/ld91g2bikiRd0ixpysSr4iZN9qUbYRp4P16OoSTSdu/KEI4Vmq53c2arY+b3Jbl7
 91ci9ZR9iMSoE7lylJVwvtICO17v/XhJkK6kIW1dp8GplL5Dm+xOKfZo/JNtsdDse6Co
 aUgkromRYqnDG0lA3deIkySZ/Hs0mWtYQkXul6pjAMzKr09rAZzaCHoDolKNA8Z6UBvf
 VqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7K9Peqvg53wE8szsSzfSVlmz81/WbwRCQEOpbLBbC0=;
 b=0IgElJX+u1CW19a3a08sUuziBCZ7AeA2vbBoi7YSZoMW+RBUFOTkc8SOUmVpVa5VHw
 gFmW2JNR8PHoh1ljK+rThNQCAQ5VDL3C1Xn/zaj8hp8plZ8lFBIpjo7k6ejGtuGTubWp
 y+yTrZ1pY2C6feWsreO3OUQBJv0qQ01NImqKPGPKoQkZ3PEEaP2rRuOYAu/yObsPv9I9
 4Vj8glCa4X3sbP1Gb5ZUFOGFJ/BvpZm940am8avSljkGM5v6BKSwh4AUbN6HehBGR9Wb
 dOp6NCgpJ880DHxdL0tY2x7WvVWNk9yk6q2p8QnmjgMci+mte70ohqgLRDmIHy8ce0cn
 53DA==
X-Gm-Message-State: AOAM5304Zno1chOHghIukwwdfE8YP8Z6cbhVO/z1DvX8B/VJQPF9U07O
 GKLN9wJwhlBXJsZXQF+x1SN2c5UYFBEdCVPeY2s=
X-Google-Smtp-Source: ABdhPJxJe/ToLK84d+Ngn6fDUEC2kQn5E59gmfYJ50BzZHUtXAtIdmX+lV2A2UFP5f0yj2XalKKmhqrZFH2jkcS/sCo=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr13103834jav.63.1634516313900; 
 Sun, 17 Oct 2021 17:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
 <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
 <2ac1b2bd-efa9-2005-5c0a-cace9346cbd7@linaro.org>
 <CAE_xrPhF+86T9m1taX3RvcMXptnmhUvP-n64S7znL4=vXUa4eg@mail.gmail.com>
 <CAE_xrPg6MF0CmQE+RzdoAavY1gJ-GDbgmh0Lqay3ogG6-zvK5g@mail.gmail.com>
In-Reply-To: <CAE_xrPg6MF0CmQE+RzdoAavY1gJ-GDbgmh0Lqay3ogG6-zvK5g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 10:18:07 +1000
Message-ID: <CAKmqyKMBn5HS+5_Q5YLw_-Ep_GTscemx-oRphecs-YK-nzS9dA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Frank Chang <frank.chang@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 00:18:39 -0000

On Sun, Oct 17, 2021 at 4:59 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Sun, Oct 17, 2021 at 8:55 AM Frank Chang <frank.chang@sifive.com> wrote:
>>
>> On Sun, Oct 17, 2021 at 1:56 AM Richard Henderson <richard.henderson@linaro.org> wrote:
>>>
>>> On 10/16/21 1:52 AM, Frank Chang wrote:
>>> > On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <richard.henderson@linaro.org
>>> > <mailto:richard.henderson@linaro.org>> wrote:
>>> >
>>> >     On 10/14/21 11:54 PM, frank.chang@sifive.com <mailto:frank.chang@sifive.com> wrote:
>>> >      > From: Chih-Min Chao<chihmin.chao@sifive.com <mailto:chihmin.chao@sifive.com>>
>>> >      >
>>> >      > The sNaN propagation behavior has been changed since
>>> >      > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
>>> >     <http://github.com/riscv/riscv-isa-manual>
>>> >      >
>>> >      > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com <mailto:chihmin.chao@sifive.com>>
>>> >      > ---
>>> >      >   target/riscv/fpu_helper.c | 8 ++++----
>>> >      >   1 file changed, 4 insertions(+), 4 deletions(-)
>>> >      >
>>> >      > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>>> >      > index 8700516a14c..1472ead2528 100644
>>> >      > --- a/target/riscv/fpu_helper.c
>>> >      > +++ b/target/riscv/fpu_helper.c
>>> >      > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1,
>>> >     uint64_t rs2)
>>> >      >   {
>>> >      >       float32 frs1 = check_nanbox_s(rs1);
>>> >      >       float32 frs2 = check_nanbox_s(rs2);
>>> >      > -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
>>> >      > +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
>>> >      >   }
>>> >
>>> >     Don't you need to conditionalize behaviour on the isa revision?
>>> >
>>> >
>>> > I will pick the right API based on CPU privilege spec version.
>>>
>>> There's a separate F-extension revision number: 2.2.
>>>
>>> But I'll leave it up to those more knowledgeable about the revision combinations actually
>>> present in the field to decide.
>>>
>>
>> I did some history searches on RISC-V ISA spec Github repo.
>>
>> F-extension was bumped to v2.2 at (2018/08/28):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-eb78171
>> The privilege spec is v1.10-draft at the time.
>>
>> and later ratified at (2019/03/26):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ratification-20190305
>>
>> The spec was updated to use IEEE 754-2019 min/max functions in commit: #cd20cee7 (2019/06/05).
>
>
> Sorry, the commit date is 2017/06/05, not 2019/06/05.
>
> But I think it's probably easier and clearer to just introduce an extra fext_ver variable.
> We can set CPUs which are Privilege spec v1.10 to RVF v2.0 (FEXT_VERSION_2_00_0),
> and others with Privilege spec v1.11 to RVF v2.2 (FEXT_VERSION_2_02_0).

I think it's probably simpler to just tie this to the priv_spec. It's
not completely accurate, but it should be close enough. Otherwise we
have the risk of having too many version variables and it becomes a
pain for users to deal with.

If the unpriv spec is better, we could also introduce that. We will
probably need that one day for something else anyway.

If you feel that we really need a fext_ver (to avoid large software
breakage for example) then it's also ok, we just need to justify why.

Alistair

>
> Any comments are welcome.
>
> Regards,
> Frank Chang
>
>>
>>
>> Privilege spec v1.11 is ratified at (2019/06/10):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v1.11
>>
>> In fact, Unprivileged spec v2.2 was released at (2017/05/10):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-user-2.2
>>
>> and Privilege spec v1.10 was released at (2017/05/10):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-priv-1.10
>>
>> Privilege spec was then bumped to v1.11-draft in the next draft release right after v1.10 (2018/05/24):
>> https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180524001518-9981ad7
>> (RVF was still v2.0 at the time.)
>>
>> It seems that when Privilege spec v1.11 was ratified, RVF had been bumped to v2.2,
>> and when Privilege spec v1.10 was ratified, RVF was still v2.0.
>>
>> As in QEMU, there's only priv_ver variable existing for now.
>> So unless we introduce other variables like: unpriv_ver or fext_ver.
>> Otherwise, I think using priv_ver is still valid here.
>> Though it is not accurate, somehow confused,
>> and may not be true anymore in future standards.
>>
>> Let me know which way is better for our maintenance.
>>
>> Thanks,
>> Frank Chang
>>
>>> r~

