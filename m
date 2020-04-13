Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO13i-0001Od-DN
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 11:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <josemartins90@gmail.com>) id 1jO13g-0001OJ-7e
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 11:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <josemartins90@gmail.com>) id 1jO13f-0005aY-F3
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 11:31:36 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46228)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <josemartins90@gmail.com>)
 id 1jO13f-0005a1-BG
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 11:31:35 -0400
Received: by mail-io1-xd2e.google.com with SMTP id i3so9669875ioo.13
 for <qemu-riscv@nongnu.org>; Mon, 13 Apr 2020 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MUmblb9c1CNe5xBbMiKwl0KEMfq+O1gLyIrddM1vHJc=;
 b=oLRj4Z8tUbgH5cxB0Yoi+opmeWkPKZAdY7FKoFdTaYOqWvrqJCgSs3CcKQY6xDSCqv
 gqjtTb8FEzb718il0J1X/39FOZ/x9XhB49GksBMTe9iiJ0hJ2somZWBl49zachxKuYHh
 ea/zI7A0qpH4sf06IzVwCwgynvV1IsnXVIuoIjgMrOGmpuO598hMQTEpFU6qmnc3IySq
 8j3Drasmc+R/udi4/uwKghtqEUlk8+IkhZcne5N5L1wJ1ZjgJfnfP0+kmZNtcxOF/yEK
 SrdBM32RwPhE6J4BXHmRKK8TUTFZY11ugBTUfkitg6rmkWdvGpqq9E631rsTORo75/ly
 Txqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MUmblb9c1CNe5xBbMiKwl0KEMfq+O1gLyIrddM1vHJc=;
 b=gY5DwkKvUKMq66B+AfU0UavAu1+qGdov6qCXp9w91Ot7nn8N2gxWYGD9AZmADbXOLW
 Wiq5gY+bIkmiOOGd1WVXuA04XItQIYYR7C5bpEOFH9r3d7V4LlmKFYzprU6a4sisimLt
 rQwa6wv1W2vwkAVPxVTWMoZHMRspi4xHnzTjgdXUCOqFk5N6gLfzgz8EWiljd38kQkYC
 DHB6xaAgMeS2KETsI4N6rK7CWDJvcRASUgyzEDFClriuOauj4tp1Z5lmX8mGOuuYXj9P
 wsa/1+tNOjr+wx+Dwtz0wkEcgz6kgSYjL7Qv0UOn1eRV/zgmcAz9S0XKcSxAXD19gH6O
 bJLg==
X-Gm-Message-State: AGi0PubooOIT3A2CLrwZsPdUvHE4FlXy7RsZQv2I/Uf/oV7lkzJdrjrY
 o1ta0c+uCEhjazDMjnNB/bdR4c7BgXhFMfQSnW1oCCTl
X-Google-Smtp-Source: APiQypJad8awirmOAsRBkSYRGvanKJdsVZgcUq6AMGJkTPXV8pPtDEZJJD7wf9ClUcKuyyfjlG1qi1oeM2cacUJlUtc=
X-Received: by 2002:a5d:8d90:: with SMTP id b16mr17010372ioj.9.1586791892927; 
 Mon, 13 Apr 2020 08:31:32 -0700 (PDT)
MIME-Version: 1.0
From: Jose Martins <josemartins90@gmail.com>
Date: Mon, 13 Apr 2020 16:31:21 +0100
Message-ID: <CAC41xo1YDkehHariEcUJh13oYf1dx_QVBSj2Frr=kYK_Lsqkzw@mail.gmail.com>
Subject: hyp v0.6 work?
To: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2e
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
X-List-Received-Date: Mon, 13 Apr 2020 15:31:37 -0000

hey guys, I'd like to know if there is any ongoing work on the latest
version of the hypervisor spec (v0.6) and if there is any scheduled
timeline regarding its implementation or timeframe for when v0.6
support to be available?

thanks, Jose

