Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6Xm5-0002UR-RM
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 06:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xm4-0002TY-Iw
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:53:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xm2-0003Zd-Do
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:53:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id c12so16251613wrc.7
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 03:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R+V+kC2d8aoq+VSZEaBx/xD8jU8GUz2o+HPVO863Gp0=;
 b=c68Dv9c5OlBr4jluQsyMLSSZSjFcgvDEHTOG7DD/WIg+Htur/ClrkdyUzzqU6+7mjZ
 x4PFWfjpUFFMiteZZ1vyKdnRs6KhW+F8LGk2v3R+uS6y2DWetfse/4jhDvIlQL9FR3GQ
 bTF7pWR+oG1FCEHbwIjfnj6MoJxTFAxY+p8PGAeCl+DojLzEQrqwV/gjXWQJ6OpqCKkm
 vEgHr79j/WoIXF5rQ7GBBo4x5BrOCfWrbBbMeFAiefRx/AXyhIrwbp6+TvwsZEW44cE4
 yBes7cNdNfvyI2jYhYAgqVIiJq4aN3CmhSzB0k18eEUS82Y1joDSZuO5Ve9ObcMEpZlI
 PlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R+V+kC2d8aoq+VSZEaBx/xD8jU8GUz2o+HPVO863Gp0=;
 b=KkPcmGchxPygVVvslmQQ+18KsPumMwPsXYOdo1m+BLM0uwqBr62nl/H4uAz0ckL/bO
 37RrB4s4K02qEe2VGf6CaTu/e/Qn9k8sx3Y+Y15Oiaiw8+TNEV6T2XfoPUhN4y+E46Dn
 nNrWOjPICmTfBPU84KfpjtKkuhmmi9o3+WvZve0Lfiew8ajT9KvdsvUbzWmU9lrp00PH
 7do6Nqo3sfhD/XHmw/3FlZo8JugfXED5hpdcBNe6GTvv1pAzxodGppNi8bdghZwrOVwI
 OFGB+Y0zS0Dl00n201nA+nHO9HXXz0n7IXap5pPwToiSN8AZcbEfHLTNkf7m5RHCF01i
 flpw==
X-Gm-Message-State: AOAM532yTPKQCUPwYsGsrv+Xcawkpmf4gHIHAo6nldsA3HYb6eQnRl7s
 HHUvSabVOdF5KvXf1DsKIne0xQ==
X-Google-Smtp-Source: ABdhPJx1E+Q4/p67XumpENPRRn4qb0QmbmU4P27kVJ0hYNkrROTcKiCSLSaxRgrWk7qIzH5UhnmZEQ==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr17288039wrs.217.1612180420682; 
 Mon, 01 Feb 2021 03:53:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm26200893wrx.51.2021.02.01.03.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:53:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E420D1FF7E;
 Mon,  1 Feb 2021 11:53:38 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-9-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING
 selection
Date: Mon, 01 Feb 2021 11:53:34 +0000
In-reply-to: <20210131111316.232778-9-f4bug@amsat.org>
Message-ID: <878s88vwal.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 Feb 2021 11:53:44 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
> already selects SEMIHOSTING. No need to select it again.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

