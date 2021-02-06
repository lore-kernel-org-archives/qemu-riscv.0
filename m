Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8Oqm-00078h-JS
	for mharc-qemu-riscv@gnu.org; Sat, 06 Feb 2021 09:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l8Oqk-00077G-GE; Sat, 06 Feb 2021 09:46:14 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l8Oqi-0001fY-QH; Sat, 06 Feb 2021 09:46:14 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRCBm-1lKac93Fwa-00NCNG; Sat, 06 Feb 2021 15:46:01 +0100
Subject: Re: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-7-laurent@vivier.eu>
 <2bb1378d-1ccb-d373-1de2-9add2f5e8a23@vivier.eu>
 <CAKmqyKMjunx2kD6u+11QbT56Lr_ruMxbAu58-UckD7oy-15OXw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1e2a030b-d41d-9d73-f350-95559ebd1f95@vivier.eu>
Date: Sat, 6 Feb 2021 15:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMjunx2kD6u+11QbT56Lr_ruMxbAu58-UckD7oy-15OXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2VXWj4b1s+4I9aqOW0oTFTs8rSwDHLoiuto3U2OlL5XXGQE+5B3
 9bEgx16bAfJtREVoXr9FZTwrOfxu4xwxcQ8VUXPb8B/yyb6495Y+NHxSamUPkdZGa/2o6bl
 PaJoPkc+r3deVii52sOktK6TPKMJ7vcAUfDkXaQ3ACGg1dnGTMielKjLw8zuO5JNHAVZw+q
 skN2H2DTvUPhOzMEeLDiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h9YgQzxm3J0=:J4uFPj7feD2EJ1dCUp3zvL
 +/HL4VGjP5t/pHt3Kem/FYUTCewrpAWH4QNDI5jTkQHjGAUi7grDytgN/j6cvM1eX8ArOXJfR
 TImZ+v0Jl4rBw6ZfrG+aVicbf7giAkby09NPtNpndvBwr9a49LKAJS3xoP678B6AcN0bm7ZvV
 Z72U4oZZndOKrdQc9h03vyns14P3lbEzcO2W8jIsTWaZ0CwaH+s5dJYTaM0wUJyLwwQHPkBEV
 oR7dJtsrclsri8L2FviDeAR5I42QnVOD0YqWD+owf/Ex6hFAtYpKiOPlasFFCE75V4ItnxYu0
 fVB0gCIs5kYRsIjhmns6jDCz6YRs4rI/lMJXzD0Cl+fTlwjegqy4grEUes4c3eoQlcdzJj8Ih
 BjANSBxS2rJZvUNO1E8q2RFCo564CO2CvzYc/5evymBuH5uy+UDvekgcKd1ETIh41earJVcqE
 wHvzt0bBPA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.105,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 06 Feb 2021 14:46:14 -0000

Le 26/01/2021 à 00:44, Alistair Francis a écrit :
> On Sat, Jan 23, 2021 at 7:06 AM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Is there someone to merge this?
> 
> Do you mean just this patch or the whole series?

Sorry, I missed your mail.

I mean only this patch.

Thanks,
Laurent


