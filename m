Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is1vl-000326-8s
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jan 2020 04:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1is1vi-000302-7U
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2020 04:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1is1vh-0002HZ-9S
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2020 04:59:10 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1is1va-0002CI-7S; Thu, 16 Jan 2020 04:59:02 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5C33396EF0;
 Thu, 16 Jan 2020 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1579168739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWggCHq2iVR6vAYfpXZ4nhLLYMEos/TRGVmYjXTFUWU=;
 b=CID4Z2SUnkjZwvSR+HkST/klc7AMaktQ2hQBNwRatGJljUsj9Uhsi4w62wyrVVJTGGMalw
 ZfjAVEfnpMESMPcCrf/Cd6o/7p4seOsYSFgjh91h3tOVmXSxYFSiglHm7UW2T5MFRV8rId
 V9PgyAbXUL4ASZgXM11IWFF/+1DWkao=
Subject: Re: [PATCH v5 08/22] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-9-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <e0cd91d5-4105-5417-22ec-b2367687ae4c@greensocs.com>
Date: Thu, 16 Jan 2020 10:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1579168739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWggCHq2iVR6vAYfpXZ4nhLLYMEos/TRGVmYjXTFUWU=;
 b=o1+u6b/JID6xTVs6KfoDaHnPeMu0bLT1P/h43XF1Xl+YSCOYhK16pMiJTMCR1BWyUEsZ0+
 Blx067AZxAUfAUqu/gaQx1CEQGjGzIquLnvcbILKycFfDlKIGs1zanYiOu9UJkwsQ/UYLH
 Hveb7532MjMQY+VgJotRrCHITKtJUNU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579168739; a=rsa-sha256; cv=none;
 b=Yrmm4XQH7iXon0GAHvjIQRTKNugnh8S9fKPh6BJwz1znHl0absnQ4Me52Q48loIBdr3sC3
 ZEUY7pK2oe5WwpkpxBmk2LX+Lq5dQy0TPAoZEco3sEGQ6xBJTLHLNlRdoNnSRCVl0rR8nu
 nlOzmtPh/11sWBW8mocjgURHZjv8BpU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
X-List-Received-Date: Thu, 16 Jan 2020 09:59:11 -0000



On 1/14/20 4:09 PM, Alex Benn=C3=A9e wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> ---
> v4
>   - fix mem_buf calculation for ppc_maybe_bswap_register
> v5
>   - introduce gdb_get_reg_ptr and use for ppc
> ---

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien

