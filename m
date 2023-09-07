Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F09CEE14D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 05:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe7mD-0005pB-RT; Thu, 07 Sep 2023 01:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qe7m3-0005oI-Qu; Thu, 07 Sep 2023 01:41:52 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qe7m0-0000CJ-PT; Thu, 07 Sep 2023 01:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTSTPkmjDi+a+9GQtEQYhs7YugWkw8lDdmzj/ItHLl8=; b=tQIUnYefwWTT1wdN0vYblOuynF
 97poRtLWkEVGtOQilPBdZ1ZGoSfw7yVjBwXaBUE7nSDyCxyuBW6Buqke8kVUi26q883jnsGU6ZQuz
 xud7xy+n+hHah27Z9fBBZRG219c0wBHdpgNKvY9nflUtoUExh/uRaQm2BsUloc0AR7ZI=;
Date: Thu, 7 Sep 2023 07:41:16 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com, 
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, 
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 marcin.juszkiewicz@linaro.org, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, 
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, 
 shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org, 
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, 
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, 
 jcmvbkbc@gmail.com, pbonzini@redhat.com, imammedo@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 17/32] target/tricore: Use generic helper to show CPU
 model names
Message-ID: <uiypj3zb47c6drdpigbua3ynzp55msopvfqnynx6cf3m2aep6z@v6xklba5i3ft>
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-18-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907003553.1636896-18-gshan@redhat.com>
X-IMT-Source: Extern
X-IMT-rspamd-score: 35
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.9.7.53017, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2023.9.7.602000
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Sep 07, 2023 at 10:35:38AM +1000, Gavin Shan wrote:
> For target/tricore, the CPU type name is always the combination of the
> CPU model name and suffix. The CPU model names have been correctly
> shown in tricore_cpu_list_entry().
> 
> Use generic helper cpu_model_from_type() to show the CPU model names
> in the above function. tricore_cpu_class_by_name() is also improved
> by merging the condition of '@oc == NULL' to object_class_dynamic_cast().
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/tricore/cpu.c    |  9 +++++----
>  target/tricore/helper.c | 13 +++++--------
>  2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

