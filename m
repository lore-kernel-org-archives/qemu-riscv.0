Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D160C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 02:48:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkC8N-0001qZ-5S; Wed, 15 Jul 2026 22:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wkC8L-0001qH-Ke
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 22:47:33 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wkC8J-0008BN-RB
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 22:47:33 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6a1160a2c42so4103458eaf.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 19:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784170050; cv=none;
 d=google.com; s=arc-20260327;
 b=DdfETtbJeAv5l6Jo2a8AEVynpUfSew2hNGheYL7J50an/lvdgdf0x/I08FpyYF3ktg
 tzzxHZvwuH/sJl8T0DqMvT4AwFj18lWiY556XH2CNhInLnpZUmiIGD52kvmSfRqd4LE8
 ixELjqL61J8NNvvp0l815fHQ6Sd0q78c0MxZe86Xe2FIexg2t+9qc7DRBEwhIhXW0k+U
 QxRTmvb+GtnFBqteOpC2Y+g/cVwhQOym3epOnqqPpK3U9O0fK5AWaH/pRoV7GAW0Tk7W
 L39ScWQVLbIO0G4xzi/SlMmksYCMLXK1MzoQoAD/iu2cEQJ4BYmZ3wQV3TGqPXfFV0RZ
 W6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Thm/xoHH9NpFTqisVtAiDpsGMRo2xFLSG/mKYGsmfJI=;
 fh=qC5QT9kmqdYACWehCrfIHmRM4/BNLtur+IhttriiUqA=;
 b=k/iK0tdCK7teGUzp5MeVkbKW5pGMgKVQMzQT8XyoWzwyA6SQGvEGh2BvOgOg5ZffsT
 YI/uCLcJnZFlbOk9B7CPPekeoK+Mg3yMibXUonr9uyFiGhbM3+30QbAs/43IKzjYvOuZ
 Qih3o/rhZn7fAgN1Oxz0wM2AUocD3huPc5GAZ4TyYcu1D377yJ6Ut+xgaSSCiHYkJQru
 w65UBs8MJJlGiXA8MVWUjEGHUyqUfmCi0Dn9VISYS2GJuNlu1kjWLTVFrSyQEFtn01kI
 Gk+KmUj4Jdh4R0Ng3FZRgYa1wTS0LC3KEWsPQANNcUF92hKuzEk80zIGBjMpHFp1cNUo
 aPhw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784170050; x=1784774850; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Thm/xoHH9NpFTqisVtAiDpsGMRo2xFLSG/mKYGsmfJI=;
 b=N7jUGMDZHavif48ko/c+pO6c98lY5VzGuXab63W0mMOxwXdp+iydfQcwoZ3UsWcC+y
 1efnvj9b5P7SGINBVr2A+I4tjlBCpytSY5OJoy8NWcHgXlOQNjh2HZTul7RGZj9Vrsrw
 aW5cfTgLfqeSPmsbvw5idfkKUVJVoCNp/Mk3K3DWCjqtmCsmCiu3dcqBzpnaHSr7H/Ws
 qKpkpo9NmuHgjjzoy71QLdczGk9aopU+0bNtmQPlpbDZUU5QXCwAT9ALOmn7D6vpk5E4
 A+/tdbgISFdNvRvAnsN337ipU0an1rpfVD+IjXEQDfoO6qU+ApKFwjnFwl05Qv/dMaDz
 MimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784170050; x=1784774850;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Thm/xoHH9NpFTqisVtAiDpsGMRo2xFLSG/mKYGsmfJI=;
 b=YBv6R5zABAAWwICibhcJyj29u75daSMTjLTTZiYQGuJR7/ixbx+JNt/qECCkeeV1uL
 sPzPmEYOrRAZ9PH0TuaTbMh9r7mA2MVQrwMNIRVMoytudmt8WFjuz6pk1HuHy1ytoRCK
 5Lt1V9PPi2KoMSZZR+9AenxmDf/+efzUnfGGrGVa7WERv3cVMJ8Dr8iydCLObOSTmDMa
 fgdHdbOspmHkcOxmd8lObkRdCLCPIERI6muSq4jtmh7RepzrG+4pAHq+C/hsvsC+WHzx
 Y4MictEIfE1otNyiC77xAXcp04LkAQa2pCiuO3kvk+4W1zHaSzlruN6ZI0RVrxUhiTl2
 YmaA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpsbOlfKzMfNTxZOEe0rAYA6W3HNz69AAXtzFdEzRYoYxqp7qewPG3Z5bNQU/QSQvkfd3w1FDk5yGQH@nongnu.org
X-Gm-Message-State: AOJu0YwaCq+SyjRbx1AA7w9VDC0FMwJI5OfmSKCxKGd5RtpxB1VpYSUi
 mNW1I1LydHVazppa/BqMkrNo0x0ZvUJb/fJeJP7z6zvoYjqnLjR+g01EYaE+HLGOE7MjsFjg2+m
 iQM2LpNNaWVG5Gwnqw2DhXbyA3pz+LJw1q8j5ujkOAA==
X-Gm-Gg: AfdE7cmjXn3gtsguTqAtGBhHGkdfeLid0ES/RbNDo5vlEVElL7ybZhEV6TGuTqQs3Iv
 G+JXtcSvLpNFOa860ALY2tkoyeudW+6Awh9K35Yn3K4XvEm1ydPGrRFETG3TMAjsUX2fPwhVTub
 uxbKiptMTLG45QfEor/BJZAyN5fC8rkC8yKCfSuUMTZYfhhPn8rutjRNnDhPRJq8otkqKfuUFvL
 ZQCQMRIkn5yInzotFo79fImhcwaRXKqXBC5bRjrUbObAgmU/RkCT2vAOz5uTq2O
X-Received: by 2002:a05:6820:4c03:b0:6a3:c6f8:4caa with SMTP id
 006d021491bc7-6a3cba72d38mr4974232eaf.2.1784170050156; Wed, 15 Jul 2026
 19:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
 <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 16 Jul 2026 10:47:23 +0800
X-Gm-Features: AUfX_mwdu_cXkx3T0p4l4LGIqeGCB4flJN-bp1iwa8bFE2Lh8WZ8mYa02UITeTY
Message-ID: <CALw707pb5iKy-CAnVn-npdP8NRGwaz+yZKGi2ZbjafqNLNJtKw@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@kernel.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=jim.shu@sifive.com; helo=mail-oo1-xc36.google.com
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

CC: philmd@mailo.com




On Wed, Jul 15, 2026 at 5:57=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Wed, 15 Jul 2026 at 07:52, Jim Shu <jim.shu@sifive.com> wrote:
> >
> > Hi all,
> >
> > I'd like to discuss this issue again.
> >
> > On Wed, Mar 18, 2026 at 2:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <ph=
ilmd@linaro.org> wrote:
> >>
> >> On 18/3/26 05:40, Jim Shu wrote:
> >> > On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
> >> > <richard.henderson@linaro.org> wrote:
> >> > ...
> >> >> Hmm.  This really overlaps the secure and space fields from arm, an=
d possibly some of the
> >> >> others as well (e.g. user, requester_id, pid).
> >> >>
> >> >> I don't really have a good suggestion for that right now, but it wo=
uld be nice to not keep
> >> >> expanding the count of these sorts of fields that somehow specify t=
he originator, but
> >> >> clearly cannot overlap.
> >> >>
> >> >> I'm reasonably sure we've had this discussion before, but nothing h=
as come of it.
> >> >>
> >> >> Time to paint the bikeshed again?
> >>
> >> Last discussion IIRC:
> >> https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2XJYXA=
MTgO3z6q6DHgqkAwRw@mail.gmail.com/
> >
> >
> > Follow the idea in the above thread. I'd plan to add the 'src_cpu_id' f=
ield to 'MemTxAttr', so we can get the CPUState from MemTxAttr. Thus, we ca=
n retrieve the RISC-V world_id from CPU and we don't need to add world_id t=
o 'MemTxAttr'. If other security attributes are stored in CPU states, they =
can also reuse this w/o adding more data to 'MemTxAttr'.
>
> We already have a requester_id field, which is basically
> "what is the thing that is sending this request?". We
> shouldn't have memory transactions that happen to be
> from CPUs indicate the source in a totally different way.
>
> > The whole plan is to add the following 2 fields
> > ::
> >     unsigned int src_is_cpu:1;
> >     uint16_t src_cpu_id;
> >
> > src_cpu_id is the CPU ID from 'CPUState->cpu_index'. src_is_cpu is a bo=
olean flag to check if the transaction is from CPU.
> >
> > Moreover, I think this idea is extensible. DMA device transactions can =
also have security attributes like world_id. We can also add src_device fie=
ld to 'MemTxAttr' to store the 'DeviceState *', so we can get the DeviceSta=
te from MemTxAttr to get security attributes. If 'DeviceState *' is too lar=
ge to add to 'MemTxAttr', re-use requester_id as DMA device ID is another p=
ossible method to support this.
>
> I don't think that having the thing that receives the memory
> transaction get or get hold of a pointer to the source of the
> transaction that it then uses to get the world ID is a good idea.
> (Especially not putting a DeviceState* into MemTxAttrs: the
> size of the type needs to be kept small so we can conveniently
> pass it around by value: we currently assert that it is 8 bytes.)
>
> I think we would do better to follow the way the hardware does
> this to the extent that that's reasonable. On hardware the
> bus/fabric is going to provide the world ID as a signal along
> with the memory transaction, and we should accordingly put
> it into the MemTxAttrs. The question for QEMU is then how
> we organize our MemTxAttrs fields so that we can share between
> different architectures the fields that are basically doing a
> similar job, just with different terminology or semantics,
> so that we keep the overall size of the type small.
>
> thanks
> -- PMM

