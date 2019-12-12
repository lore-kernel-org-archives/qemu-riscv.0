Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifDi1-0006SV-G2
	for mharc-qemu-riscv@gnu.org; Wed, 11 Dec 2019 20:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifDhz-0006RU-7M
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2019 20:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifDhx-0001Ou-QM
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2019 20:56:03 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifDhx-0001MI-HU
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2019 20:56:01 -0500
Received: by mail-pf1-x441.google.com with SMTP id l127so262258pfl.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2019 17:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZcpmQQfWOxKGqTFSxMEKdaMLE/l4mvb0EyNfdGxA7g0=;
 b=WsVL++IzOAmRyHiVEHDRVSBjhsDi/SnZivmlTsKiEChne+P8jVI3yM2Li21eHRcc4c
 Ev4R+uxUidf08FOChuAKAADyZBsjsfesfaMFolhkQrVDK/LG1K4HWEsW80LnYJbRee2C
 hmw0A4sKd6PCiSvUnsz0TIWXDYlE7A+5YUSwoVaHfA7vq4Tcqie/A0o1xF57q8R0hW0e
 V6cgz5z9jGNC93Z00YiTAx4ub9IeqBV9/QWh8+AoIyGAIs9uSt41brEm6cXs05/xad3z
 hBun3TftB/2OSddVF1XGB4DE0BZcwaNLlIeY6PApnAuU3BN0sul79xBevbwsFPk7oeyI
 YZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZcpmQQfWOxKGqTFSxMEKdaMLE/l4mvb0EyNfdGxA7g0=;
 b=JpKcvY/nqRZY2hPU2v3ahcX/vTdtI7dau22KHOMRa+4Qy8ikreS80RonV3ys182+Iw
 OD5iZDAblHYA6dDlMuFbKOr6RP1O8ntDn1ovEGpAtwzAiArzesgpUxIpwkB85tN+KSk0
 g8dF3HlbNzqVXrcAK6a4Alom+OWbnLD/I1SGVjAQ/FaQHrT+Av+fCv9K8Oihjkv+hFk3
 C+DkzxKtUfLQIwch4CfDnwxrKx9mUd3Hhws+rSXgRVVBJ6O5zgw4FZNK+lWzY1mBbZmc
 RvdMY6o9+0H3dLEr/em2+3tZ0SrlJRB3GS+nq+gLJIpeVsF/ijERbmMzio3/RFezNRqn
 UkAw==
X-Gm-Message-State: APjAAAUDfd+TbEUAcLhhzlhhFQDeZcpAj4mEGz5haxnbdtrO71aKWOq7
 WDaUISKZXpOyfWIp3WYbZ4+w7w==
X-Google-Smtp-Source: APXvYqyhITzwXVS5e7icg7DK8QtXs5njvApH9ofZ43U7RW9EK0jR2qhd6W2itNOLUREGZTE7XU+kuA==
X-Received: by 2002:a63:4702:: with SMTP id u2mr7765676pga.125.1576115760284; 
 Wed, 11 Dec 2019 17:56:00 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id u190sm4459483pfb.60.2019.12.11.17.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:55:59 -0800 (PST)
Subject: Re: [PATCH v3 08/20] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <134bfe14-23c3-4301-bb45-80024f9eb4fb@linaro.org>
Date: Wed, 11 Dec 2019 17:55:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Thu, 12 Dec 2019 01:56:04 -0000

On 12/11/19 9:05 AM, Alex Bennée wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


