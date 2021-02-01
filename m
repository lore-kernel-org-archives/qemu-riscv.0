Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6XLB-0002C5-CA
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 06:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XL8-00027V-8A
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:25:54 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XL5-0006ik-99
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:25:53 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u14so12303713wml.4
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m5OBG1mxAQtmmh38dFJc6BLX5xdqGhPXpKBfe+9+c7U=;
 b=ST5GYBxnpD5YQCec5Lh6fgW3Aq8HGc0nLIA6MZTnVkfhktZ1sdylJVGVg71kptV35/
 LabsBLi8H7HMNYNcC5QAw5PqNRL5tNIuEGywy1b6K04KYik1qUQTZcJK1Ax8Gh4XvN8x
 gEyHh6rhQsGVrwNWtrzWdqL04boxKizEBA4EGa+0CY8S7v51ATgIKjf+nRDHCpkrQglk
 rupjxAeMWWILa0yMFxnK1hPHUFpbHRfhLLJ72sCMMqij0LlUUlWkAlJfkcUsRKRMyTLL
 wV9vr3920jiyLf8gRG2bxDfrU42W9LPadFmlCmBQ4CKAZ1EtiIEbjKCoFsu555pKcHwK
 mvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m5OBG1mxAQtmmh38dFJc6BLX5xdqGhPXpKBfe+9+c7U=;
 b=jIXlQ+60PCHB58aBCtBjnmd30fVUdeaKJVpCxFndkEnDik/9N+Hpb2Y4K2PVYHeW2e
 l/neZkI0g9GGTedDMHuWq+6g6Su357zCP03CHxtZjIp+IIf+vWAI7C7cFqtUtT6HMO6Q
 slV2StWY8vRhMb44mze8rt45DqREDsw2zQKm+1LSyTJ1boFJdHFK7+1iXYfC4Uq+zm8x
 zIflQn89sWqEIJSrvhVk+SxuUtecULlb9qVmJUOgL/97EoWak9ACFE9zteoSLqyB4Bct
 dCsF+K/16Nu4FetDw8XzddgEWJ/mk45yWCL096zgXMx3T6zDDaoNgsG5uc0zcJ0Gv7MH
 Iq8w==
X-Gm-Message-State: AOAM531Akovjx8CcomtB6w9dvhfZAyBhHpioboD4yAT3ShnacdYSZr0M
 JUCRQwno32R5cVT1o/5X40rwnw==
X-Google-Smtp-Source: ABdhPJz5IEhGCB7KxNMBqgFBwtJA/iRS4VvblX4CzSbed6qw32q+bS2WyFiTMT03nos7jFyHNGg1QA==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr5930425wmq.70.1612178749718; 
 Mon, 01 Feb 2021 03:25:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm20236520wmd.15.2021.02.01.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:25:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C52BD1FF7E;
 Mon,  1 Feb 2021 11:25:47 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-8-f4bug@amsat.org>
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
Subject: Re: [PATCH 07/10] target/arm: Move V7M feature to target Kconfig
Date: Mon, 01 Feb 2021 11:25:35 +0000
In-reply-to: <20210131111316.232778-8-f4bug@amsat.org>
Message-ID: <87bld4vxl0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 01 Feb 2021 11:25:55 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> V7M is an architecture feature, move its declaration to target/arm/.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


modulo previous comments:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

