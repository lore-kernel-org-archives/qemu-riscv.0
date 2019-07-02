Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiG5h-0007BP-Ho
	for mharc-qemu-riscv@gnu.org; Tue, 02 Jul 2019 06:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hiG5c-0007A4-ER
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2019 06:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hiG5Y-00071V-5Q
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2019 06:32:42 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:40654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hiG5T-0006st-Ow
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2019 06:32:37 -0400
Received: by mail-wm1-f48.google.com with SMTP id v19so383414wmj.5
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2019 03:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yjn5fIAjsuTiAkzRM9YhZGZLVS1yAVdOnuz6kuPBWQY=;
 b=rvi6feQJirMoYb3ufuxGSkPCnUmhqCpgD7HmXp5wiMFcl5pNtyMGI1j7tqsZPPDwkK
 t4c3J1uKeA6zT/W0xUaPe5hVgt1N06m8X6Y08gqwDAHvIHaY3tZSZPM8DMhfODiSlp3b
 yqcsBVl4Z8UzkZD/r6UPX+StfuFiezWNvjEBP3bS+ES89Rb1QcP0gckpNeen6WRft3ps
 Hem6Fd56mP4GR24P34h7MW2CuRelUBdVaRmqESMJDCNEioke2wXTAvn0G7lPSdnNUSc7
 56JS1mdulde26BSfYLr0tKcAoHbkS1nZ+EPhnCANfgum+66Uox7o0vW7DQHtry5bCMka
 Oqyg==
X-Gm-Message-State: APjAAAWPRpdE9PSZFfeWYy4TkD2gz2GFCNttzbWHW09ooGB2Qyc1WOEE
 IlK2PrpWP/vIao3cse4+LKnQVA==
X-Google-Smtp-Source: APXvYqyoS2q3CVHOHTcU/rAU+Q+Kx2F55SmRYS2gFUNQT467SuoCzplNSG7CukYyAai/E1WFDQFBFg==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr2921393wmi.146.1562063548849; 
 Tue, 02 Jul 2019 03:32:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:68f6:70ea:5bb4:f73?
 ([2001:b07:6468:f312:68f6:70ea:5bb4:f73])
 by smtp.gmail.com with ESMTPSA id x8sm2484773wmc.5.2019.07.02.03.32.27
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 03:32:28 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Jeff Cody <codyprime@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
 <5896113812cd914308e5b617377f8e8205224cfe.camel@wdc.com>
 <CAFEAcA_-h6b_f1fuWh7NkGo+FT0xSyCDXgd3b4pwEvNDN8HcJw@mail.gmail.com>
 <87a7dxqdl5.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5fb05ba-e313-b9db-9cfa-2c6f7c1b90f8@redhat.com>
Date: Tue, 2 Jul 2019 12:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87a7dxqdl5.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.48
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 33/34] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Tue, 02 Jul 2019 10:32:46 -0000

On 02/07/19 06:12, Markus Armbruster wrote:
>> Yeah, if we're not building the apache-2.0 parts then I think
>> we're OK, and as you say there's the question of whether QEMU's
>> GPL affects what we ship as mere bios blobs to run as guest
>> code anyway. But it's sufficiently not a "really obviously ok"
>> that I'd like a second opinion; cc'd some people who might have
>> second opinions.
> 
> You need an expert opinion.
> 
> My non-expert opinion: we can't distribute anything that's not
> compatible with GPLv2

Guest code is not part of QEMU.  We don't say that SeaBIOS, SLOF, etc. 
are part of QEMU; it constitutes mere aggregation with the GPLv2 QEMU 
sources, so it _is_ possible to distribute APSL2 guest code with QEMU.  
IANAL, but I'm fairly sure about this.

However I agree that LICENSE needs to be updated, something like this:

diff --git a/LICENSE b/LICENSE
index 0e0b4b9553..81b9b3572d 100644
--- a/LICENSE
+++ b/LICENSE
@@ -1,13 +1,18 @@
-The following points clarify the QEMU license:
+The QEMU distribution includes both the QEMU emulator and
+various firmware files.  These are separate programs that are
+distributed together for our users' convenience, and they have
+separate license.
 
-1) QEMU as a whole is released under the GNU General Public License,
-version 2.
+The following points clarify the license of the QEMU emulator:
 
-2) Parts of QEMU have specific licenses which are compatible with the
-GNU General Public License, version 2. Hence each source file contains
-its own licensing information.  Source files with no licensing information
-are released under the GNU General Public License, version 2 or (at your
-option) any later version.
+1) The QEMU emulator as a whole is released under the GNU General
+Public License, version 2.
+
+2) Parts of the QEMU emulator have specific licenses which are compatible
+with the GNU General Public License, version 2. Hence each source file
+contains its own licensing information.  Source files with no licensing
+information are released under the GNU General Public License, version
+2 or (at your option) any later version.
 
 As of July 2013, contributions under version 2 of the GNU General Public
 License (and no later version) are only accepted for the following files

Paolo

