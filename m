Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTP42-0004UT-UW
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 09:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTP40-0004Tp-Jl
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 09:47:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTP3y-0006Qa-SB
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 09:47:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v24so23954755eda.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Sep 2021 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
 b=hhQ6niECsnZzrG0mdkN3l2WljsCA50VtPKnZq/g/2/G/ZURvGbApaDR4yM3Qu7Nedr
 yCbU2ae+DEh22mAwEsYAFVeHCmi2bWr7WdChJM2pKepbtPDure7P44nCJZ2ISY4/vdNs
 bq8yhJ5dTW5mGd3AfNM1D7FzOCp7GGd6zmvX2Sac656+re+366zG2dB+NClxqXqRq0xh
 htyslKOh7ULkt6Pot837zj5o9iN+TyPQOYd2F9w9eoRyHdRezVHYpRhoZ3Njl2piiKKY
 XjR+oCA6huAJMYDWQDZUBthnwD5zHMYYY3ylJSOJ4a0uQ9yJ3GvdPxnjKj4UhEWK172g
 MV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
 b=z4et2wcTqm7NdFSh2vbMJNeL5vO4+24m5PChlnc681KowdAXeg87zMCclvYtJUt62o
 /dZYQT01oIHcYYajTbBqomxglG4LxbPfiv1T2xE0WjpwpOjI9tPq9h7frCzl09EGIsqA
 qBRfEb98cHczfTyiLcCXQMk1AA0t8G4MwcxUGGbmBztvqMN2bsjUfEUTMZDc5776XpXk
 Us9FqEzAKx2Z5CNfTxGrz0sIhXmU3gaFyolh8Joo8BABc3xcgl7LWDjE506sJ45XlWW7
 cxv3HAN05qfHc2kLE5T7fa0Iigpauw1cwQ6FxaTFyBb0BDMQ13EkqcxD3JlsHHgLSyEl
 0wWg==
X-Gm-Message-State: AOAM532PUhwEQlX+Qn03ujJ6PGniT+yRKUo2PqcoYYPBMb79qS9svIkn
 YMi3ORZnP4LHFgamDqnqbVwqU9d1Ojg4eDYoTK9S5w==
X-Google-Smtp-Source: ABdhPJwICFJ0kqduDlOdG2Bm7hRT1CYmYq3zG89jCtiaURODn4W0xVzTn8I3igE6k1ZKJtFQaXUt4Jr9El0Yfcd7sdE=
X-Received: by 2002:a05:6402:3128:: with SMTP id
 dd8mr5448390edb.383.1632404816373; 
 Thu, 23 Sep 2021 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
 <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
 <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
In-Reply-To: <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 23 Sep 2021 19:16:45 +0530
Message-ID: <CAARzgww_dxXLhJTm1jeWzbQxVGzT6YNxZi+uTrRDnBZ9Z1v+QA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Sep 2021 13:47:00 -0000

On Thu, Sep 23, 2021 at 6:13 PM Damien Hedde <damien.hedde@greensocs.com> w=
rote:
>
>
>
> On 9/22/21 19:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/22/21 18:13, Damien Hedde wrote:
> >> From: Mirela Grujic <mirela.grujic@greensocs.com>
> >>
> >> The command returns current machine initialization phase.
> >>  From now on, the MachineInitPhase enum is generated from the
> >> QAPI schema.
> >>
> >> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> >
> > Missing your S-o-b, otherwise:
>
> Sorry. I did not realize I had to add it since it was already done by
> Mirela. I'll add it for this patch and patches 1, 6 and 8.

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_S=
igned-off-by:_line
btw, it's strictly not mandatory if you are both from the same company
and you did not write the patch or contribute in anyway to it.

>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com >
> >> ---
> >>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++=
++
> >>   include/hw/qdev-core.h     | 30 ++------------------
> >>   hw/core/machine-qmp-cmds.c |  9 ++++++
> >>   hw/core/qdev.c             |  5 ++++
> >>   4 files changed, 72 insertions(+), 28 deletions(-)
> >

