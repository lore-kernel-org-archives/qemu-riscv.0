Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l97f0-00040U-EW
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 09:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97ep-0003xu-C2
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:36:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97eT-0003CP-AN
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:36:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id m13so17344327wro.12
 for <qemu-riscv@nongnu.org>; Mon, 08 Feb 2021 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5egha2QnD0RR2IdHbFZ0Il093WPbovj4c3xLJqCEJLo=;
 b=c9RbL2kHECbnf0oxnzxEIhYCY6OyKuhya1k336NCTbhB0qNfXyqUjWX/db7NkR1wy7
 Upi7DcQc4RlDA8cLyTEieEvSlHvQzRwOJSdz6GUDJgStTJ3GIwK0clnrJNzeOokVkXzg
 I5WzzUi6F8V4Rw/GRrRA54Mg4aL6dL3aRNzzmqrXIBtbLkkXfHJ29cqVZ4qoUcA47zwi
 x0ydZqg+Bp41C+JjnrR2GAw2K0W9JJZj6dsvtf8Js9U3zdfhjSw0QOldW0Z/0lLMhbfC
 AfTNcaq/uxCpyLxFMOPANbs8SIcAGh9U+h0eLvPk7RPnxupvP58ziKZWl93VieN65H4Y
 ElJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5egha2QnD0RR2IdHbFZ0Il093WPbovj4c3xLJqCEJLo=;
 b=Tg7JiMaISdyUujL0vofoA9VjXlsyYSpjco0Qd+rKjKB39lDylGHjJC6KHHnz+0bABI
 hrt2HcvgoDWihTewUMaeX/z6c6/DFfxj1KpllvvOEQ9BEoWZiyvjUEDPar8Cb/O90LTl
 YPObT/olrMGCFS06Tt8jE7pjkjvuYVcihj6iuIqL/dszfVtJplHvo9o9zNHleFb3EBZ7
 FgV3dELrOtn6Own01432LqDAFVOxf73s7+LQ3xaZW2WDpUVAng9wJT7QmA+XOQ/HC3eZ
 zR5pLWfCzd/pPQTC824WMpYAPTWBQpFl41V94EcrkSVlhln+dWGPHVScN0vhjk2646Th
 Px/A==
X-Gm-Message-State: AOAM531xc7Sznq27jmHW+jSZYnyQRtFtw3CK7BwvAfvipStyCOYlSia7
 thS/npAtvS5S9Uc0TeiJZ7Hh/Q==
X-Google-Smtp-Source: ABdhPJyY9Il6EtsRtM0PvNLcnHq68dIii3hbQO7lWzOnSm1JT2tR/pCBQblS9FTlG1A+7L7YXXIYJw==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr12759184wrs.390.1612794987704; 
 Mon, 08 Feb 2021 06:36:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a21sm17470627wmb.5.2021.02.08.06.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:36:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2E0A1FF7E;
 Mon,  8 Feb 2021 14:36:25 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-5-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 4/6] accel/tcg: Include missing "tcg/tcg.h" header
Date: Mon, 08 Feb 2021 14:36:04 +0000
In-reply-to: <20210207232310.2505283-5-f4bug@amsat.org>
Message-ID: <877dnibp92.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 14:36:56 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Commit 3468b59e18b ("tcg: enable multiple TCG contexts in softmmu")
> introduced use of typedef/prototypes declared in "tcg/tcg.h" without
> including it. This was not a problem because "tcg/tcg.h" is pulled
> in by "exec/cpu_ldst.h". To be able to remove this header there, we
> first need to include it here in op_helper.c, else we get:
>
>   accel/tcg/tcg-accel-ops-mttcg.c: In function =E2=80=98mttcg_cpu_thread_=
fn=E2=80=99:
>   accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: implicit declaration of fu=
nction =E2=80=98tcg_register_thread=E2=80=99; did you mean =E2=80=98rcu_reg=
ister_thread=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>      52 |     tcg_register_thread();
>         |     ^~~~~~~~~~~~~~~~~~~
>         |     rcu_register_thread
>   accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: nested extern declaration =
of =E2=80=98tcg_register_thread=E2=80=99 [-Werror=3Dnested-externs]
>   cc1: all warnings being treated as errors
>
>   accel/tcg/tcg-accel-ops-rr.c: In function =E2=80=98rr_cpu_thread_fn=E2=
=80=99:
>   accel/tcg/tcg-accel-ops-rr.c:153:5: error: implicit declaration of func=
tion =E2=80=98tcg_register_thread=E2=80=99; did you mean =E2=80=98rcu_regis=
ter_thread=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     153 |     tcg_register_thread();
>         |     ^~~~~~~~~~~~~~~~~~~
>         |     rcu_register_thread
>   accel/tcg/tcg-accel-ops-rr.c:153:5: error: nested extern declaration of=
 =E2=80=98tcg_register_thread=E2=80=99 [-Werror=3Dnested-externs]
>   cc1: all warnings being treated as errors
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/tcg-accel-ops-mttcg.c | 1 +
>  accel/tcg/tcg-accel-ops-rr.c    | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mt=
tcg.c
> index 42973fb062b..ddbca6c5b8c 100644
> --- a/accel/tcg/tcg-accel-ops-mttcg.c
> +++ b/accel/tcg/tcg-accel-ops-mttcg.c
> @@ -32,6 +32,7 @@
>  #include "exec/exec-all.h"
>  #include "hw/boards.h"
>=20=20
> +#include "tcg/tcg.h"
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-mttcg.h"
>=20=20
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 4a66055e0d7..1bb1d0f8f1c 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -32,6 +32,7 @@
>  #include "exec/exec-all.h"
>  #include "hw/boards.h"
>=20=20
> +#include "tcg/tcg.h"
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-rr.h"
>  #include "tcg-accel-ops-icount.h"

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

