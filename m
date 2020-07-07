Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jst5q-0007u6-57
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 15:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jst5o-0007sr-2g; Tue, 07 Jul 2020 15:17:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jst5m-0003pp-M9; Tue, 07 Jul 2020 15:17:23 -0400
Received: by mail-pl1-x642.google.com with SMTP id x9so3465974plr.2;
 Tue, 07 Jul 2020 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+aBqs9LPwOIUbBvvI+QYGmRkcw0/BUEJZ7R2yRpMXOk=;
 b=nKGyzHpbBDckSKVGAMqyszrJyyQgiio6j5kX65b5lFeklav3tSJ7ppxjMROXIbbhXs
 /8L0yZdS1+vbRUFf/ohsgR+c9MmSNwyIPqTyK4cYoQifgs5lHY7Ldk9lM1TVlhU0fv7u
 Fg0r+KPC1FkDRWv/U1WCFR9o5CCLJxQaZS3X9FGcouH7OLGt+hsqvTTecaRVCyjkC64j
 4GUFs41YfvJ9uLo7xcTD6YXmlAUKkRYuwg8QWIHLHZGZf/Ywwl9BMyU2nIa+GSs2cHrK
 WyRcCeVZ9CJEdSLTe1mqHRDDk6OsYtZKLHcbqdhcKt+lJwQeq3BkEZf0lkIXWyjQOLKv
 AvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+aBqs9LPwOIUbBvvI+QYGmRkcw0/BUEJZ7R2yRpMXOk=;
 b=Sy7A1hMOWFyVy9kqg8xpUOeMz9LSCRou7bPI3VYkQLrpTtpPlCK7a4XnvuKNkDtVUv
 wLLZ6wOIfyWGr6rPKikxJecru/fyDyOXltHgDiL4Vlu0h+ghU2NF3PIBX1lsi6Lgn0oh
 NM0YqeSG7cLhAO148nI+yTOxP67i4lXNB+ME64FWolZCrGxiOwTwgmswWWpm/4ZgfuAE
 2MvKSTAzSqHpyYTLf04VNfhHQw/RsVrZtVnQVG4mplqpQOEErp0xcSjXGpDluT/KrbxE
 LZO3pfUonzBswo2S+nUet1424GbVas6NPaFm3qAzTl0tqgo9evw1CVv3QST5MZoF/QeI
 9fqA==
X-Gm-Message-State: AOAM532qSFDl2ebcRK8qRvrP1YPnGF8H8uQ8TyIXzRb909gCL2szH7uU
 /7ZgSttMys7wDaRokTmD7DJQhJiK4BagGyKIWWE=
X-Google-Smtp-Source: ABdhPJyx/7FK3cQwBbEqj3B+eEpCZYaARPHFeZRnseKldH6YYO2wXIWbrBibJrXfYWIESsgszzgQ3wokRx8ysk1J5XY=
X-Received: by 2002:a17:90a:20e9:: with SMTP id
 f96mr5950224pjg.13.1594149440253; 
 Tue, 07 Jul 2020 12:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200705174020.BDD0174633F@zero.eik.bme.hu>
In-Reply-To: <20200705174020.BDD0174633F@zero.eik.bme.hu>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 7 Jul 2020 12:17:09 -0700
Message-ID: <CAMo8Bf+0Qu=ErRveiA+V7jQhiD=pKj_t=B0dp0CkbDqzquf5jQ@mail.gmail.com>
Subject: Re: [PATCH] load_elf: Remove unused address variables from callers
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 07 Jul 2020 19:17:24 -0000

On Sun, Jul 5, 2020 at 10:40 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Several callers of load_elf() pass pointers for lowaddr and highaddr
> parameters which are then not used for anything. This may stem from a
> misunderstanding that load_elf need a value here but in fact it can
> take NULL to ignore these values. Remove such unused variables and
> pass NULL instead from callers that don't need these.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
[...]
>  hw/xtensa/sim.c        |  3 +--
>  hw/xtensa/xtfpga.c     |  3 +--

For Xtensa parts:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

