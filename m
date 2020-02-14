Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2gkM-0003vN-Nb
	for mharc-qemu-riscv@gnu.org; Fri, 14 Feb 2020 14:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j2gkJ-0003sM-QH
 for qemu-riscv@nongnu.org; Fri, 14 Feb 2020 14:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j2gkI-0005FX-LS
 for qemu-riscv@nongnu.org; Fri, 14 Feb 2020 14:35:27 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j2gkI-0005Ec-DB
 for qemu-riscv@nongnu.org; Fri, 14 Feb 2020 14:35:26 -0500
Received: by mail-lj1-x242.google.com with SMTP id e18so11909098ljn.12
 for <qemu-riscv@nongnu.org>; Fri, 14 Feb 2020 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/FNFc7xZutUXvShMEwdkK3qXhf9yUhDE95gYJZu3dGY=;
 b=pMbGZx3LQcctML6kRyObJKqgWxADu9LFvkepd1JT3ZqIsO0ptzr8h8/D71ZAMG3i/S
 nnE7wxX1ETkqiidf9fqFYN5Z43ghcQ5L/x8PtZW1dKfZCJL0Q0fIQr7UlUw+Yahjvpbd
 Sm7w66Rz+gZ/DNu/VPtbvoFYfxi8f1KQ6tyr2QOPlqx88zqK9pXY0oZjYdp7oU9JdHMX
 4wqQu9ZhO9wR7fOJzibeaW/o5YDmZ0tc5CbeCnj3OsRdq8GBmoba/mvDRfD/w6JOmGTj
 zGLd1W+eT4F3WF0TeWpNUlTEAiZi0wyc9kXmW3nolyR7kYNkIgDJeRLyWY/DgPHNn1bO
 Zq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/FNFc7xZutUXvShMEwdkK3qXhf9yUhDE95gYJZu3dGY=;
 b=kyXttD+sQLWQKD+tGB8YRau8rNFj44T2V/maTcY+SiNN0sUTadpV33lgLnkUIRDhSK
 O0Z1f/SUfhImiTzffIqIP+PhF6+c9mE0Uy1bsBbQNdjrD60iZXec5MF4p1sdH/3zamji
 sWnH6kFeH8FMM3TRN84pZi1Ebi/CyvkNg/yZkYF0lGHdQTe4+2xoxdh/UYhBBgjffFuy
 72IVKmpMwqCwnuncq165DW8F5+uk2qpT3AT+eoAi3MmmnG7llEm48DAEpfiAlLOONIKy
 6IQIcNSkadxZHJmpvfyrcgQ7LnPSUBjuz9xVLlJ7l71cLH01Aqs5DwZ7UVag97nOBMt0
 b62g==
X-Gm-Message-State: APjAAAUndrGBtlFcVmT+FYx4X42Dl1FiuRNkci3Xs8a/F/EjEVfQC9sD
 S86xICVcdpYRiaz1IPmnHo0qTrmHm/cLIE+3XfeMkg==
X-Google-Smtp-Source: APXvYqyKmfswMeY3rNopXi++mbmfe8rqP4erI73H3WBjXB8w5lW/PqVQ8n1tJ7+lvOcwrD2tr6MeYGIjpWOk5jm6dt0=
X-Received: by 2002:a2e:9955:: with SMTP id r21mr2939937ljj.283.1581708924665; 
 Fri, 14 Feb 2020 11:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213225109.13120-1-alex.bennee@linaro.org>
 <20200213225109.13120-15-alex.bennee@linaro.org>
In-Reply-To: <20200213225109.13120-15-alex.bennee@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Fri, 14 Feb 2020 14:34:49 -0500
Message-ID: <CAEyhzFs2Ge7zb1CfByWBfatgB+mbwndMwKFFsEZ=vbALMUmxYA@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] target/riscv: progressively load the instruction
 during decode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, aaron@os.amperecomputing.com, 
 Peter Puhov <peter.puhov@linaro.org>, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, 
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, 
 Richard Henderson <richard.henderson@linaro.org>, balrogg@gmail.com,
 aurelien@aurel32.net, 
 pbonzini@redhat.com, stefanha@redhat.com, stefanb@linux.vnet.ibm.com, 
 marcandre.lureau@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Fri, 14 Feb 2020 19:35:28 -0000

On Thu, 13 Feb 2020 at 18:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The plugin system would throw up a harmless warning when it detected
> that a disassembly of an instruction didn't use all it's bytes. Fix
> the riscv decoder to only load the instruction bytes it needs as it
> needs them.
>
> This drops opcode from the ctx in favour if passing the appropriately
> sized opcode down a few levels of the decode.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Robert Foley <robert.foley@linaro.org>

