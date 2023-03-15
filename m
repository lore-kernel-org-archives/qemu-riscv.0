Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pca3O-0001M3-Re
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 18:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pcZCS-00005f-9W; Wed, 15 Mar 2023 18:02:24 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pcZCQ-00065g-3f; Wed, 15 Mar 2023 18:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cv/hyF/BM7Qs01Vk3pd9iphT2D4CHx286tP6lF+86Tw=; b=P9Fp2zH6p649rRZvSem0puV8pc
 wfqpLHAskVpro7OGM/j9iidjkzLEvv3Z2UdRH6y5I6rVN3sF8v/0aDYzSY9NYgk+xUHZIIwSsUuq2
 xB+zCzw6daLnKlBsJcJEfPpTWdVjrjuArIZ8MxaUuApNjQTsICcJ+2sQtSPj0uJj/JCg=;
Date: Wed, 15 Mar 2023 23:01:39 +0100
From: Alessandro Di Federico <ale@rev.ng>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, Igor Mammedov
 <imammedo@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-arm@nongnu.org, Marcelo Tosatti
 <mtosatti@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Alexandre
 Iooss <erdnaxe@crans.org>, Gerd Hoffmann <kraxel@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-ppc@nongnu.org, Juan Quintela <quintela@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>, Darren Kenny
 <darren.kenny@oracle.com>, kvm@vger.kernel.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Stafford Horne
 <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Sunil V L
 <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>, Thomas
 Huth <huth@tuxfamily.org>, Vijai Kumar K <vijai@behindbytes.com>, Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>, David Gibson
 <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Niek
 Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>, Laurent
 Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, David Woodhouse
 <dwmw2@infradead.org>, qemu-s390x@nongnu.org, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, Bandan Das <bsd@redhat.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Tyrone Ting <kfting@nuvoton.com>, Kevin
 Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant
 <paul@xen.org>, Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>, Peter Xu
 <peterx@redhat.com>, Anton Johansson <anjo@rev.ng>, =?UTF-8?B?TmljY29s?=
 =?UTF-8?B?w7I=?= Izzo <nizzo@rev.ng>, Paolo Montesel <babush@rev.ng>
Subject: Re: [PATCH v2 30/32] contrib/gitdm: add revng to domain map
Message-ID: <20230315230139.507b8bb4@orange>
In-Reply-To: <20230315174331.2959-31-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-31-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Mar 2023 18:57:04 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Mar 2023 22:02:26 -0000

On Wed, 15 Mar 2023 17:43:29 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> +rev.ng          revng

Can we have "rev.ng Labs"?
I suggested this in my previous e-mail too, but maybe it slipped away.

--=20
Alessandro Di Federico
rev.ng Labs

