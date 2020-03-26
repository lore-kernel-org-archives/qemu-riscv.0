Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaAG-0001tP-5Q
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaAD-0001qo-Ml
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaAC-0008Au-OX
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:35:45 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:37600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaAC-00089W-Iq
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:35:44 -0400
Received: by mail-oi1-x22a.google.com with SMTP id u20so2231302oic.4
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FHPo6R9+P4ugxx2FOsK+YSWlnmcqgznNMFclaNoulYo=;
 b=xXjTsfX2ZVmKAmop6OwPTzhWbT9gVeZ3yJLoK0oOZFXD0U9ztptIbfAKVzNhV6EopB
 o94GVhCUzIhF1RFnY9t5aPdYaAWhqgJvK91aPJDFgYPptIXIvO/4E7WF4BpVffrqx/1Y
 wufz5jcUI49v5GbQuzpVvw6sDaF91KvvXeJQYbjXzCUDpZ7FpBlTts+ltAIEEoLA/fMp
 Y7ABJt/GXh7yCAO7u3VbrNzThlHMGkSD3ONNyNNQ2EMlxDr8gpiXL4wOALbWQznSxQY7
 PwuVjBF9Xv/wtg6/TiWjVj+q3Fez8clEOf/F+a+UmdMRLNEctQ7qhH9mWM1XtoUgBiWJ
 afjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FHPo6R9+P4ugxx2FOsK+YSWlnmcqgznNMFclaNoulYo=;
 b=p7bkxb3dYFvdWwYU7kKFGMRrXnKmtlDK+GrFvBViUYc57PYRiElzM6Gv2VowrVeVam
 aL/y7rs56JZRVWeJuwvnW8HGDs3aB4E5N5Vro4Npg4TGqp/DyicTYYDfPAnhRZ/CSa9y
 kaXzNTtvam5MNTMzfARGAni0cXLFwL1wzuqdRSjk5CXoFMse0DdQ4zLqJlMOLu+FqN3y
 4ejaohgIe6l3E4cPFLubphZBavG8HFq/tstMTqwSJK/AMkKs7/9IBM8m5BHlJO74lytK
 nAzrPhAfm1dDlmsgTqbA5F59fIjnBc9AlUoL3wUJa8qTgL01skDXaWZJNYheFBuIDwqy
 vE2w==
X-Gm-Message-State: ANhLgQ1Nmq5UI5PTdMFEo94IPdQg944vyODmTvQ7R7/QDGUYUFNzoqpa
 6BVuu8pAvYJODyni1EU6ntOCKJueR8EdMAAmv2dGYA==
X-Google-Smtp-Source: ADFU+vvo4NqYzmW7cRiMOCxh+cTUzcASuf0QDF9+LrHs27q1ny+W4ekrEqQsxq4BKCNmz+JR5Zr4qX06PCMTMCJa2sE=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1745762oij.48.1585258543758; 
 Thu, 26 Mar 2020 14:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-4-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:35:32 +0000
Message-ID: <CAFEAcA_bxHKfw8Oh2A-xtyfkeYk7-vrGvmG0MCjFR7Si-ErfKQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 03/12] hw/arm/fsl-imx: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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
X-List-Received-Date: Thu, 26 Mar 2020 21:35:46 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

