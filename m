Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAm-0002rj-N7
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAb-0002XU-SK
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAE-0000bC-OL
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id l1so18036728wry.12
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25098w81ZdJk4QE1ACGYU4dK9BpaVvc0WWo+YnpOAf4=;
 b=P6dH6tvUd5JoqkM0dgrAaQ4Aq6b+lqgKbbGepq37H7nEO3POTkztFiAOEpjBKIuy1g
 p1rH41NxyM9coPshGwHKl+TvTZsYuw6LzQYJuk1szpwCg0KNpRseNbTaXbt49hRLCR3X
 AoLL3aVCIQmTRYOvWiycdhvC6806+SxPk8GIpbLdj95N0Ft1XQEUg+4dZPa4OVvzW8gL
 0Lj3s5YAvBNSFwQduhDQRKzKO9czvZC9sQpRHZ1NW1KyEf8n46pUPSOT8H0oU07usT19
 kJtT8O9tgPgLhTuMgZj8OIzqPeyiGs1LuETQ+k/oxQqf9EQO2ICsG3IR2n3saNIRS4z7
 N/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25098w81ZdJk4QE1ACGYU4dK9BpaVvc0WWo+YnpOAf4=;
 b=WZuk52Ra1YksWavCsybmh978i9OsKRsKPORvCPvaN6JfgTfwmXME8iXhldxI9rHqSm
 SJHbmQFJUeY75tvCEZK65eJMI342YPWB4DX0FSKckQpAcUNZSL7Uh2s+oFHlHRegb/O/
 HXF2pN9gBZ9y8XMJa1/7fTXtIZ7YwKlcF+0Lm1/zxOcomF9N2WnfnNGBH+VhLOC+iaew
 BEBKbOFMeCehoRDs+1IEvEb0kox5ocRNX/I8NWifBb1WVGMmw+eeOD3RRRKvPkTnBzCB
 MHO3ttK0i+rv2Hqg1Pq5nfUIwvDjntk7mEsTEd43NIrsOWEFfMsxK68dwBL87IJH0/Ui
 RQ6w==
X-Gm-Message-State: AO0yUKX6OQbLdmM+G9taWHO/e+POGOvDqOID3cNnu+PxrDwE+4+7K7DV
 fDF11SjRALgB0YwE8P+sQFGB4A==
X-Google-Smtp-Source: AK7set+F7vBr2fuLeTM+ocjNeJTTbIULQhEsD/SAM7kRDk1HYlrEIn5dP4nPXq/j/DcqvwdnZMEkTw==
X-Received: by 2002:a5d:6686:0:b0:2cb:3deb:c014 with SMTP id
 l6-20020a5d6686000000b002cb3debc014mr2630876wru.28.1678902229801; 
 Wed, 15 Mar 2023 10:43:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a056000100500b002cea299a575sm5090268wrx.101.2023.03.15.10.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B5881FFBE;
 Wed, 15 Mar 2023 17:43:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Howard Chiu <howard_chiu@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 26/32] contrib/gitdm: Add ASPEED Technology to the domain
 map
Date: Wed, 15 Mar 2023 17:43:25 +0000
Message-Id: <20230315174331.2959-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:14 -0000

We have a number of contributors from this domain which is a corporate
endeavour.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Cc: Howard Chiu <howard_chiu@aspeedtech.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Troy Lee <troy_lee@aspeedtech.com>
Message-Id: <20230310180332.2274827-4-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 8913a886c9..65e40fe8e1 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -5,6 +5,7 @@
 #
 
 amd.com         AMD
+aspeedtech.com  ASPEED Technology Inc.
 baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
-- 
2.39.2


