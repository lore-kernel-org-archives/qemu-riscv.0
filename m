Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j0857-0003kF-Dw
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 13:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j0854-0003fF-TY
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 13:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j0853-0002Qz-Qf
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 13:10:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:56251)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j084u-00025W-OY; Fri, 07 Feb 2020 13:10:08 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mn2iP-1jPWUB3S5P-00k7iN; Fri, 07 Feb 2020 19:06:09 +0100
Subject: Re: [PATCH v4 3/3] vl: Abort if multiple machines are registered as
 default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Jia Liu <proljc@gmail.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@gmail.com>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-4-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f8b5897f-c11f-0272-cac8-f63e12f3783e@vivier.eu>
Date: Fri, 7 Feb 2020 19:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200207161948.15972-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DEDuIkX6UTzl0UIsKYz9L2Bxi66PAdlc/VZ1uyo5ezk6RL6Uz6x
 otK8AEVbV8hr8cRlhAOB94M2/g6+zaHzwHOsCx2dRaZYdMbHukGSWvE1LZDuUqRSOvBe73p
 QJK99PcVsvvvX71VEJVc5FaXAihGPg29I3BiEXk2Fa0K1sVX47hM3a7GB8k2Ivyh19/kErx
 OhgfgljBD9gKaOD+VvnBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cDzOnH2VS0Y=:ZzTSstoTh6yNBdM0xm+NTb
 q3PUr3hM2yQtMt4GhUyGHLKcTV+GWEMBjFR3Z4VQWKVr1Ov5LFQbpSiVjaWSNsg3J72dGD51U
 dvFrmd8xORHkEw9D5VD4WKK3TruF3KZx6psJqy0LzFtUmIO20I5cx+XVlHyvUNIQyrZUxEVfh
 iNvFORH8+HLL4sCinHZP7+hJP0VNnKwyEBUivTazsePEcfY9mMa5Hmd4bbQnZ4c35O9qD9mIx
 ThHdr/HgxUF//G/oseJw1pWKsfKPxmjZhKkpVxF8nTfamQzUNOGQ64BHXIo6iuWFDf5u3AJN/
 /1js3Jd6PqkCTwSSL92bwaCsGPVpLdk3r588FPA/31sP8r848h7NCgg1KqadMvlFOnptnvDR9
 qrcF7eD2uFSwuyaMrzCyZai2OZrjU3om0pGFnZ9HsxEezLssM6hY4vAi0gzfJKgfouevjr7ts
 uPaOAUjp3lQfYLSCvfCoS9cwrj9c2cYntS5tL71iyboUWxA1bcJ20EvjLs5W7gC53DyX2Eb0y
 TaRePhrkz6JBMB+Tcy55NVmjoodJQxjioCCbcOmF27JQ/lrHmBYpRLVLhoA/W0HRhkuw2OtYP
 SCQ8RzuTnMh7X3cpW8/8OqdqyZO9ypdRnb7qY6vH0uB6AsQ8yNKrhPuPePpy5P1nLQ8ibCz5S
 cO1eF6k5WV8SG6ySGJDLqLiQ+DZw0Q9/NHnsu9ru+LHgTh13X3uze+ReG0hWZ92JBzm2kk9We
 Qm0espPbEE+eSouHXwUYm/S1LNtJ49Ho8hksyaK5nIGyK7S+9PKhRgrc0TJgwkb9negUFormx
 tuRCDYPieR5sqUrVxzPj8Z8mp+VYnGBcADmQeXh0ay6DO+bZGgF12UehtWDHZHXcnYY/WqD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
X-List-Received-Date: Fri, 07 Feb 2020 18:10:20 -0000

Le 07/02/2020 à 17:19, Philippe Mathieu-Daudé a écrit :
> It would be confusing to have multiple default machines.
> Abort if this ever occurs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Use assert() instead of human friendly message (Marc-André)
> v3: Move the check to find_machine() (Michael)
> 
> Cc: Marc-André Lureau <marcandre.lureau@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 7dcb0879c4..ebc203af0d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1184,16 +1184,18 @@ static MachineClass *find_machine(const char *name, GSList *machines)
>  static MachineClass *find_default_machine(GSList *machines)
>  {
>      GSList *el;
> +    MachineClass *default_machineclass = NULL;
>  
>      for (el = machines; el; el = el->next) {
>          MachineClass *mc = el->data;
>  
>          if (mc->is_default) {
> -            return mc;
> +            assert(default_machineclass == NULL && "Multiple default machines");
> +            default_machineclass = mc;
>          }
>      }
>  
> -    return NULL;
> +    return default_machineclass;
>  }
>  
>  static int machine_help_func(QemuOpts *opts, MachineState *machine)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>

I've tested "make check" actually fails when we have several default
machines.

Thanks,
Laurent

