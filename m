Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1903EEB59B
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 12:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soigh-0003h7-NA; Thu, 12 Sep 2024 08:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soigZ-0003a1-Jl
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 08:12:31 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soigX-000631-Ex
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 08:12:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso941647a12.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726143147; x=1726747947; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSke8FlFE4N6exTtc6EKOjb2LrZxkDR+LzQcBycp73g=;
 b=p/OKdYJZgFGpFyEQag1stIvoDStfVqwgk8IuUbySBy20Oljgm3519odDMbzhDJex/+
 0S62bG2rLNGjRtcPVDb3Ke069BWe08fb8ne3Jh/eGwuePSQHnJoog+G+OMhImLOwywP1
 iBJfQka+mebLNtDGdArRbmTKp47Xk8BIjfAyRIlws7PPmYslD1+tkKDq9b6WKvttcX26
 Nxa3V4AUvNBKB3SEUVXJYqR3349c9eySXDzV13GbCh2sCq/698l/v1MwvV9ecEyO+4Zh
 rVKV02NXppM6F3p8AaBfYkIrDZGZSGRTRtQWQaxche2RWxYuFJY9yJPQ68cBW8G0+Qr8
 +64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726143147; x=1726747947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSke8FlFE4N6exTtc6EKOjb2LrZxkDR+LzQcBycp73g=;
 b=snbbGOAsrcAP5d2tJ/SDj/wdTsbS/2UPIdTzKdFYqaJdqLHmXWmldCQveVfFnkUwjm
 981bFddnN7cHQSqdHUHgFR70iWK1TC5ixJ0BsiMuBs51eIsU698lTq3ByOLddQMQDPBt
 YSe4qqs/e4xth3/+4W6mLOEZnsxhahsJUsXxVuI7Wf1vLoNKP9kiSYtO/B81U6XmMJG4
 2sas5G/WPBCsyDoVLP93tBmT4SWiTl+aYwarU5iLZzq51/FhYo78S3a2l7wAZUU1/McO
 aNf4iyGPgcJBPDkZ021LJ4QH1S0RYLZj7XqQUIxndnPEd9ax6Hq0z05JnPVNEl364wfB
 jZpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy0b++w/ctmem8J41nN8BY2FAC+eiFut6K+fR1mOh6y85kjUCaob3MB4em/J9ewalcvu0p5fcSQVw4@nongnu.org
X-Gm-Message-State: AOJu0Yw9bNkmaL+qHWSJWlmQhEIyABZ3RcxoARsLFIzgvLJcobbZSeiO
 0I9t5lst7+RsikCon4LoKwxo6XzabWcPodpc8a6pAXWsT3jLV37t43eP0xcjvGWahAg+vU4JPm2
 SPGVN/LJtjZxOY/foR92iUf5cj6v1DHG6Bi860g==
X-Google-Smtp-Source: AGHT+IETQd/3dKE+DCudKgky7MhTcKDOjT4e304Trb0+62Sgjre9CoznMfjV51Zt3iOwKhpGntAfXRHw7wfNzHrHWeQ=
X-Received: by 2002:a05:6402:3881:b0:5c0:8ea7:3deb with SMTP id
 4fb4d7f45d1cf-5c413e4c748mr1736077a12.22.1726143147135; Thu, 12 Sep 2024
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-15-pierrick.bouvier@linaro.org>
 <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
In-Reply-To: <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2024 13:12:16 +0100
Message-ID: <CAFEAcA9rx6jSZ3SHa1=H+-r6H4KopK3dUG=qmqRgt=nVcs5ueA@mail.gmail.com>
Subject: Re: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with
 g_assert_not_reached()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 WANG Xuerui <git@xen0n.name>, 
 Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, 
 Corey Minyard <minyard@acm.org>, Keith Busch <kbusch@kernel.org>,
 Thomas Huth <thuth@redhat.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jesper Devantier <foss@defmacro.it>, Hyman Huang <yong.huang@smartx.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org, 
 "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Peter Xu <peterx@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>, 
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Thu, 12 Sept 2024 at 12:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 12/9/24 09:38, Pierrick Bouvier wrote:
> > This patch is part of a series that moves towards a consistent use of
> > g_assert_not_reached() rather than an ad hoc mix of different
> > assertion mechanisms.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   include/hw/s390x/cpu-topology.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
>
> We usually don't precise "include/" in patch subject:
> we treat include/FOO as part of FOO area.

I would say either is OK -- if you do
git log --oneline | grep ' include' |less

you can see plenty of examples where 'include' was used in
the subject-area prefix, especially if, as here, we're changing
just one file.

-- PMM

