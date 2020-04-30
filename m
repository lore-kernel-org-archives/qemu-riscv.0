Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUF79-0007xM-Ak
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 15:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUF5M-0005sH-RJ
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 15:44:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUF4A-0001lL-GE
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 15:43:04 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jUF49-0001e3-GR; Thu, 30 Apr 2020 15:41:49 -0400
Received: by mail-io1-xd41.google.com with SMTP id f3so2788305ioj.1;
 Thu, 30 Apr 2020 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W3Z1SmoA9/EiEkkUdnPjK8U7/UeISeTAqHxbvQN5Jlk=;
 b=U30xWxJpCTvkDhC/CbaK5ZU1ANMRBtvFZKkCcB4qfzfGo2wQGStWJYuIPqX3o3pXeJ
 1absiA+eawXRDKjj0Y4rYUNomVRfSYGFl2VSBzr0t6+ZgPrhg90kXeJY/S1x97Iz1950
 6/FKHZ85IopR2dCOwQf2ysASsAtQGWalJnzsJEE8FwSKJBTAb8B0E7SzcOXjctVsunJi
 6bkOHg1oX+9cw7dvW0U5WW6LFKcje2FScigUCi3brZLm6/55MCRGKxe+3bGXoDBsCXgR
 M/vlgwpPdAqrPi5Ktw8FJAZzkbdkhiRqY4AO8gKMvZD8z8r2tYtWPI95wK5P9SI59yVs
 II4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3Z1SmoA9/EiEkkUdnPjK8U7/UeISeTAqHxbvQN5Jlk=;
 b=CzyKvjKSkxA4Qheip4rEMqcPzYVVxMZ7PE+DXR35I21tTNGiyPSMVxynj1U5ZlHHjy
 kdSxfvaR+8KxPJeh4t2rOhqHeiCmxg2OY+vZcYBU/BJ+X7TkwQF3a5xv7pS9ugH16ObO
 nQXCPg5v6gSKcVaxr3fLRvG42KRQv9xTJ3+g6LCX9vbyHeZJKD64+j0fI2q5Jz2ZrAHe
 H8YDFmW3//f2HultWcJKgto5csJ+ttF7OQ554e2zeBth9001nqA4bV5oAuQNst8XePwN
 aZxE3MAPtqHZUcAUFaBFiAOtBcsj9pQjZLWwrG9l/AVqwV6hvxsMvmuMjEWFGkQA//To
 aoNg==
X-Gm-Message-State: AGi0PubtiU3mQuhNt9TKVa/dNIqayCLnV7U7wprtiR2GoSraqrkVKYi1
 3+x+dGlMYlGvqGCCI/PPhoL8hyPPJKSnCt8sssE=
X-Google-Smtp-Source: APiQypK4c94NgdEAYNZ2/BfjWKUf59MNXOebsIy+FTlnHLoSQ/J9Q6thl4zBCe7FQ8E/c1a0xSaVyp1bGW/UALqNkDo=
X-Received: by 2002:a5e:880b:: with SMTP id l11mr450375ioj.42.1588275707609;
 Thu, 30 Apr 2020 12:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2O1k+cn7EO3Zu3U70qefFwGa5B1iNRNgRwLk7SGX=-Aw@mail.gmail.com>
 <CAKmqyKPDzusVqzCFwCJ+2gY0qchguhR57zHNkE-0MTeffKs_OA@mail.gmail.com>
 <CAC41xo3qeQZ+i8XoQq3j80_JDEoL2yMA__arpmE+GXyjX4c1sg@mail.gmail.com>
 <CAKmqyKPJ6QqUULrDj9NX_bLdnjsjzPOGcCBH5q23fG=ScT_NzA@mail.gmail.com>
 <CAC41xo32aWNZteKP-95AtFXQo3w_Ey-7MA0-dL_uJmEMScAuhg@mail.gmail.com>
In-Reply-To: <CAC41xo32aWNZteKP-95AtFXQo3w_Ey-7MA0-dL_uJmEMScAuhg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Apr 2020 12:33:13 -0700
Message-ID: <CAKmqyKOnpJQUHVnzGVBjPkib-Z1vfdWqLx1HmfbGascFFG4DVQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d41
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
X-List-Received-Date: Thu, 30 Apr 2020 19:44:53 -0000

On Wed, Apr 29, 2020 at 2:08 PM Jose Martins <josemartins90@gmail.com> wrote:
>
> > Your change just made it true for whenever virtulisation is enabled
> > (in which case we don't need it).
>
> This is exactly my point. As I said in the commit message, the spec
> clearly tells us that "Interrupts for higher-privilege modes, y>x, are
> always globally enabled regardless of the setting of the global yIE
> bit for the higher-privilege mode.". HS is clearly a higher-privilege
> mode than either VS or VU. So, if virtualization is enabled, HS level

I'm not sure HS is a higher privilege mode.

HS is privilege encoding 1, which is the same as VS (VU is obviously lower).

Alistair

> interrupts must be considered enabled independently of the state of
> the actual sie bit in mstatus_hs.

