Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k99rV-0002V4-SE
	for mharc-qemu-riscv@gnu.org; Fri, 21 Aug 2020 12:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k99rT-0002RH-TL
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2020 12:25:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k99rS-0006LF-9E
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2020 12:25:51 -0400
Received: by mail-ed1-x530.google.com with SMTP id ba10so1938381edb.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2020 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xAXLD9Q3otui5Bl43GWm+lD03Ind6e56MO+R8sX/WIg=;
 b=Z0Hay3obaNe2n5x2h+NUFpp6Sx+OQhlKfWnTEEL9DF0b7ErEeLcI7CSRCRcj5i0cXH
 zJCNj4ZejCrHoXniXIOTLpX2Y+I8QFj7iSC8IGL9cAD21NFS2TI6taDEmpjdXoH+BDIF
 WIp2IH6yzhMv9hoZbIYb5mjc+0bYFTmz4xUvRBGt7cx8jwjSM2lU04HfYB6xLR3QUoOr
 w4KP/nusjpFi9TApeGmcG4L4pnzIhig+hDXN9k6N79mc7FYdmNi/eeGDrtB3HlNjolHV
 f4buG4tjCeoem3KAbjz2uocQIQNjW67JylSTGh2aWSl7hAu+SuRjDam0WVlXHIMaHDxE
 4HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAXLD9Q3otui5Bl43GWm+lD03Ind6e56MO+R8sX/WIg=;
 b=GsArIMeAuACXFtiJxsZtSmO2T8AkbTyelRd9O6N6xwFahQ2E7+/XuPkClLGejAOccd
 TuN0RJS0C3IztEXqagxOU/lYxrIj2eWLqBZx1KBjcOcLvogWfvQTRIHWzim41KCQsiUJ
 Bt6wDTzHMsvTUehMwK9Dya8yDYv+X0QBtg4n0LDB957A5ZuoLlnw/Tg87aF3FuJ1LsN0
 RkYoFx+9aAbvp3iqU2B5EMRbAEVOEKVa7dr3zELd2rj3XeQfG2N6pDzPjxJxVzY9f5j/
 cLZghe95VzJvWVL3rA5nGcGKaEjYjXU5Vp0R1rA5+c2je0aTyQurZ6DFqw7sxJndp7iR
 VuvA==
X-Gm-Message-State: AOAM532l18PFoRM4mCo3P2CnDsYQuXXXCd1PBgCWY05srW2b9otilUuS
 s1zPI9xXS17axI9bo+/OvDDoIufM1UomVOIa2kAzQA==
X-Google-Smtp-Source: ABdhPJxziEIIeu1aKpdsinXfXOJEK5gsVEydsQ5beNQnSYKspa7CvOr4xpYvT3D932+w+h5V1XSC3aLHckak5gJPKtQ=
X-Received: by 2002:a50:8f45:: with SMTP id 63mr3732018edy.52.1598027148668;
 Fri, 21 Aug 2020 09:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200813052257.226142-1-stefanha@redhat.com>
In-Reply-To: <20200813052257.226142-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2020 17:25:37 +0100
Message-ID: <CAFEAcA-OMwaMbrp60Gd3URMykAxOxd0+_SogW13VCRCnhn6JHw@mail.gmail.com>
Subject: Re: [PULL 0/9] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Zhang Chen <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Stefan Berger <stefanb@linux.ibm.com>, 
 Juan Quintela <quintela@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 qemu-ppc <qemu-ppc@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Li Zhijian <lizhijian@cn.fujitsu.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 21 Aug 2020 16:25:52 -0000

On Thu, 13 Aug 2020 at 08:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit d0ed6a69d399ae193959225cdeaa9382746c91cc:
>
>   Update version for v5.1.0 release (2020-08-11 17:07:03 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to bd6c9e56aba2e1b9a307642c72375386afbcf1f2:
>
>   trace-events: Fix attribution of trace points to source (2020-08-12 20:28:5=
> 4 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> macOS dtrace support and cleanups.

Hi; this conflicts with the meson buildsystem merge, I'm
afraid -- can you rebase and resend, please?

thanks
-- PMM

