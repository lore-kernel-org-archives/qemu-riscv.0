Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRMtR-0005Zw-Cj
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 17:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jRMtP-0005ZL-Ad
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 17:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jRMtO-00036q-73
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 17:26:51 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jRMtN-00034s-PQ; Wed, 22 Apr 2020 17:26:49 -0400
Received: by mail-io1-xd42.google.com with SMTP id z2so4096907iol.11;
 Wed, 22 Apr 2020 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4dS2queDcDvYC7IXsJvQeC9fkc+O9hHFZS63p9xynU=;
 b=UdMpr21j5UpXNyLl89Wsn+F87L7PfI+bkPDO0qMy94+0q39MpvfJd6jh7d/9YkUbbw
 80bn8LkC3dJVcpHC+gH7pEcVbk389J6RLuNWHi/wzQKoDV2+U0aRXLZinqrfJ4RyGXdF
 hP496UN+/pg9mP3F0UIh7yocwKDST4DiBGG2mV3A0a3qfyK4ASPB+N0hJBjmuKC2qoBh
 EycgaoGEj9mnL/+ygGmFYiwljFuV3hfojCU+I6IUlTLDK5263U4KzafQFuyhK/U9UOiE
 cmWxLbqzpKgACBy6MBAyUlYc2xhqRTLzqw7O286CxWvTlAl0uqrUd5c5h8mIuOgoS3dM
 C7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4dS2queDcDvYC7IXsJvQeC9fkc+O9hHFZS63p9xynU=;
 b=JwpIWS9Bfxx0erPqxSuwM3GLzAIskplO0hGgfCojN5OYJpHBKdraK2AgdYcy4QyV0R
 ugI+9NMRySEChGYUfTM6ihHoxIW0F1f0tab1aX5w74qxHrrcTga1NEX6teRjEJngIKrB
 lRFr08zCv1osW5v0MuAs8iKAZAu6RmGpYUS8dFqA1unPuYhp6eh0Zgtmqkka9/DcKVXz
 7yTFQx4PS45CjrQEbQAmHo3cbs78x9lJadSszgcs6e1P9HIy2y8jZ3HRcAlHCdNZxfn+
 g8wqW35D69GwfWV0WMa4R55jKIVrPv9yFZLetE7O+wGG3hbwV09KiwxA9JUq3yUO0TnU
 Nugw==
X-Gm-Message-State: AGi0Pub6AkFLO2obGVj6xhgr73TQYXn4PvVB96kxAF0UEsHDksDTGYJU
 0RaQPsNV6UCE58fN29uJBNXc82eeVkndWZLY6U8=
X-Google-Smtp-Source: APiQypIOOZxalW8sWv4dlBePb3wr2WrH1kOCA0ftQ2vBku7TOwvRY0kv0D+5jG7k8xl9CxRlDvzXYkHhyFfXj0N6Bps=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr719486ios.175.1587590807676; 
 Wed, 22 Apr 2020 14:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
 <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
 <CAKmqyKMZ9x+PXOxnFqE5e-h+cCZjJThEBjJip_OCppjX71DSrg@mail.gmail.com>
 <e65178b8-32b0-b389-c58a-6883b9bc0989@linaro.org>
In-Reply-To: <e65178b8-32b0-b389-c58a-6883b9bc0989@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Apr 2020 14:18:17 -0700
Message-ID: <CAKmqyKMyynW3qwyGfHx3ifvu1045vg+tFu3r7ncekTfUDVP=wA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Laurent Vivier <laurent@vivier.eu>, 
 Riku Voipio <riku.voipio@iki.fi>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d42
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
X-List-Received-Date: Wed, 22 Apr 2020 21:26:51 -0000

On Wed, Apr 22, 2020 at 12:20 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/22/20 11:05 AM, Alistair Francis wrote:
> > Just to clarify, this patch is still correct right?
>
> Yes.

That's what I thought. Thanks :)

Applied to the RISC-V tree for 5.1.

Alistair

>
>
> r~

