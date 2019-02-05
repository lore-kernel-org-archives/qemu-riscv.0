Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqyPf-0006dw-BB
	for mharc-qemu-riscv@gnu.org; Tue, 05 Feb 2019 05:57:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqyPd-0006cj-Ek
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 05:57:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqyPb-0005Pu-I5
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 05:57:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gqyPZ-0005Ne-Tf
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 05:57:07 -0500
Received: by mail-ot1-x344.google.com with SMTP id s5so4917612oth.7
	for <qemu-riscv@nongnu.org>; Tue, 05 Feb 2019 02:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ELM5cQ+GydWY1A6D/Ro6CgGuWodud/1Xku0XNGIrzx4=;
	b=CMkEt3GR3TsQ8MHvk7O+46cZKNfGdGiZeialfyY7M5Vu15BaGDjG7ThuMZNgNZ//GD
	BBkt43zkyFgx259PhnhJhNVRoxcmXJipmLB4n4S8WbmA9nayUQYCpjuRLg6jC8zI5u7C
	R4LByA3oD7RCc/lI4BW4IVIiTgfKWnLC5lm7cNGWMt+IknjUlcZPKdRcyo6hvquYB+Dl
	2KSV8NUjVZ2dgK6qRXHBaIac0kvm+waiRju/Qf1RMP6Y6LAdQGmg7w9P6N6lkEP1mz4c
	OdIy4DpJe8tMGiEwwdCPtWdV+0gZwaTpibiV0WU58MSxIH+HBFQp8UjP+t1mdQd+su3d
	4YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ELM5cQ+GydWY1A6D/Ro6CgGuWodud/1Xku0XNGIrzx4=;
	b=ZNNl5d0PAopaAf9gVopJU+9BAVoDNKD2gcqA2pHptXehhrVwNHHBWyBJOOzxqyqypw
	yzWyK4X1RACjNL/FuY8CsU8tZEBVw5HkRVzOFKHnMQEQH4HF9sUYIg7p6uusE0uCPRhc
	yhd+d/+VjSOgrJhE8hFumJgbz/rnHwHVaUs8qQ/1Ot0Q5ycs9w1lTadEdVVGDVw/xxIe
	lGzKSJZ1YA9p5DiQYCvsUHLg59azouxb5Gbi0jhfyE2ljIsbwqJaHPhbc23aXw9cUqHD
	+pcOnGKh4Qlgzs9TQeV6YlS+FxHSsRaF0QSR0SVNn0/ED4JPm9Tra/sY8nxHPgZMlyAw
	pvJw==
X-Gm-Message-State: AHQUAuZt5s7QanGzsWZhPDmk3UMJzcuUhzXk65nTSg8VY8oLfCYjRoJE
	QC+tAG9SrESw/Q3YAWvuKVfo8C4b58yG+2gvElpYVg==
X-Google-Smtp-Source: AHgI3IYSGXJSipC+qe0lnOaSjxfxzSRlRI2zoNqpBVtShQ1lFiJyJyIyJU30MymJs5JumMVeTcjuS4gRqgn64f36p+E=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr2133396otm.363.1549364223017; 
	Tue, 05 Feb 2019 02:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-4-philmd@redhat.com>
	<87a7jaag7q.fsf@dusky.pond.sub.org>
In-Reply-To: <87a7jaag7q.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 10:56:51 +0000
Message-ID: <CAFEAcA8-YDTnszv7Mk+F+OAxGJSmdu4yEio1j-E477HNbh-SOQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>, 
	qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Tue, 05 Feb 2019 10:57:10 -0000

On Tue, 5 Feb 2019 at 06:44, Markus Armbruster <armbru@redhat.com> wrote:
> There are two justifiable function comment placement styles: (1) next to
> definition, and (2) next to declaration if it's in a header, else next
> to definition.
>
> The rationale for the latter is having the headers do double-duty as
> interface documentation.
>
> The rationale for the former is consistently placing the function
> comments close to the code gives them a fighting chance to actually
> match the code.
>
> I'm in the "next to definition" camp.  If you want concise interface
> specification, use something like Sphinx.

I'm in the "next to declaration" camp. I don't want to have
to wade into your implementation to find out what it does:
document it for me in the interface, please.

My standard for patches I review is "if this is adding a new
function prototype in a header file, add a doc comment".

thanks
-- PMM

