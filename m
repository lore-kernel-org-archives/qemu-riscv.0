Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2mwh-0006OT-Az
	for mharc-qemu-riscv@gnu.org; Sat, 09 Mar 2019 20:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h2mwe-0006LO-NO
	for qemu-riscv@nongnu.org; Sat, 09 Mar 2019 20:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h2mwe-0003Nw-2Q
	for qemu-riscv@nongnu.org; Sat, 09 Mar 2019 20:08:04 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h2mwb-0003LO-Oa; Sat, 09 Mar 2019 20:08:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id e4so1078559edi.3;
	Sat, 09 Mar 2019 17:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iMDUqXE4BEZy2kvWXX64+liFF7rIhbPSq6jl04Ozrk8=;
	b=sB/g1v0oJFId1HlUIpeknJWIlEl0lSQ0wMW6zI5dQI8ep3/oI1nv5xvKMFCcTvUV5Q
	mvl9NYh2WKr1SK3/GAYLmirYxwNzJcqvPRCR/9MVFaW42RMbLoyoXOsiPJVEDL5pm0rU
	RI0HzP4Jw5nNgrZKqOMgEaD4OdGOvFWjU/DjmPWmK5F7dGuuSC30QfPc1OPWsOzCwXYj
	e1f9tPqY7l/4Vegqcw5hWMzjqT0kdvhz83M9rAKFIopy+yW5Bmr6HqxIh/iMFQJ1I9Eq
	FyOvTtMbZcUE9UJxn3qJOrSpWAJJ//1liGpMV71jwaop1DnMuK89fh2G5Ynbk57DklUD
	PiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iMDUqXE4BEZy2kvWXX64+liFF7rIhbPSq6jl04Ozrk8=;
	b=IknA5v87x/o95GFYkkCglItic0xYf6cCmDy3bYS0herqcbVaprFRAtyvddNx0iofJU
	yWWa3rcXLR9M+ARx1gjT4gvhTJTyHbodW4o1hmCjAcXSaIRHYAyXYMBRZzMkBVl1upWG
	i9//Kjt5d7J5zyErO7GYFUdjIm7Y8iJ5qOB7BNGTujgnUeQIVU6niwV12z5FROou4zJi
	TfZDfjiimo5rd60UGpSrLyuXA4R+7CESlJbqJMMwVz0zxPsptSGzVCYCTynpsOGGvO+z
	e+hkndvUaSw4HJvw190wqfM/jsJLxJmfKhFQyvsyH+yRJZxQRZLLDEVpUicTx9MbsVb5
	ZT4A==
X-Gm-Message-State: APjAAAUzhQVU3hRHSo/kNL4jqwrdYeqShfjhuLu3OYt0MI8JNrik0/Ez
	j0BhgpgMGPLeYRtBuBJVPaESH/gwk6FAT59VGqY=
X-Google-Smtp-Source: APXvYqwxEUlHqgSrc4qV5CqP6XpAhL61rK7OFTcf7/vpMucy7CJcPlJfUwU0JB/sRlMTKn65/rdr9jjE1lIu5byTy9o=
X-Received: by 2002:a17:906:69cf:: with SMTP id
	g15mr17032253ejs.157.1552180079692; 
	Sat, 09 Mar 2019 17:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
In-Reply-To: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 10 Mar 2019 09:07:48 +0800
Message-ID: <CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
To: Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/virt: re-add
 machine-specific compatible string to /soc/ node
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Mar 2019 01:08:05 -0000

Hi Lukas,

On Mon, Feb 11, 2019 at 6:13 AM Lukas Auer
<lukas.auer@aisec.fraunhofer.de> wrote:
>
> Re-add the previous compatible string "riscv-virtio-soc" to the soc
> device tree node to allow U-Boot and Linux to bind machine-specific
> drivers to it. The current compatible string "simple-bus" is retained.
>
> This is required by U-Boot to bind devices early, as part of the
> pre-relocation driver model.
>

I see no problem with U-Boot working with current compatible string
"simple-bus". In fact I had planned to remove the compatible string
"riscv-virtio-soc" in U-Boot but did not get time to work on it.

> Fixes: 53f54508dae6("hw/riscv/virtio: Set the soc device tree node as a
> simple-bus")
> Signed-off-by: Lukas Auer <lukas.auer@aisec.fraunhofer.de>
> ---
>
>  hw/riscv/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Regards,
Bin

