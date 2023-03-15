Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVFk-0001mo-58
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFe-0001ZK-V3
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFa-000281-58
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id o7so8691267wrg.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ftomCMN9D7t/TUiloNrLyUYQ5fiuNqGTG1HcraBz2M=;
 b=v7vvvpLKuTVpAv8ps0Pq5QZaS+C/K2Uzyy9Kd6A4+ihyL3N/1JJjYNSBZX1ycukERb
 pzkJE41/Wmw+JG7EXuGc6a/1wIxEyLt1aaQE9yoI2DkJwYs8LZRNJXWC5yq1FAvDAV+O
 sBqPXOMx4lGGFNGlrtJ54AiimM7+1gfDjheacUJLzuvhR+G/ru6tIsq3SXerh3MvtZ7h
 nwtNXrBQejuD7vBhdIzyceekpMqTpqbUdZPYYnLjeItExVL7ThO6fD9v2jBp4rzwrvaQ
 BVUOt2P8vzX53Mnj7E+vRXdiGWZQuYHcntDQiFtMsPp3ooJAlPckNZGCH2qooPfqSaTy
 isFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ftomCMN9D7t/TUiloNrLyUYQ5fiuNqGTG1HcraBz2M=;
 b=8SEjDB4Z5VhSjCdZzhohyNfiaw41dnGH+Kskipq720hng1eYj3tH9qfCAwhMQPnQCw
 qHWAmu3tzvteORvJd7Soynq5AivKMEp/WVvMADrUsetzCMAhoJaV1UTovSrCg1RCdijx
 DeExJ8NoN7Xf4MLZzzcVgMd6rKe3WQV6YNHvZXBxPps6/zG3EW5WlGvv4gQcP6QyHYNv
 JqDRv8qKAEATK2PY4MdGPjYbNBt2VwdVqRrIeSiRSNvaOS+Vn9Pu47Sa5LoQSlvKHnyx
 JyTo3MUBko8pw4EE2OSGSODFuNzRyjPyC8yFM26llaQxqPM7hr/vQfuNCu3Ha3rBnneU
 RFVw==
X-Gm-Message-State: AO0yUKVIKFP0cX7049fQSFHJcNOziV4Ky2/FlDTRko1ixTwn/wRGGkOf
 ysCHDMqj0znXaFQ5/q/OvD6hVg==
X-Google-Smtp-Source: AK7set+gIRu8mJmziJy9zHAyVl0XTVtsz+R+CSfjtPtXyE3J6uGRxhl0NzAlapKHUbHEtcUczbUTnQ==
X-Received: by 2002:a5d:6ac6:0:b0:2cf:e70f:d1a8 with SMTP id
 u6-20020a5d6ac6000000b002cfe70fd1a8mr2652066wrw.10.1678902559959; 
 Wed, 15 Mar 2023 10:49:19 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b002d1bfe3269esm88021wrr.59.2023.03.15.10.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D4761FFC3;
 Wed, 15 Mar 2023 17:43:32 +0000 (GMT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 12/32] tcg: Drop plugin_gen_disable_mem_helpers from
 tcg_gen_exit_tb
Date: Wed, 15 Mar 2023 17:43:11 +0000
Message-Id: <20230315174331.2959-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:27 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Now that we call qemu_plugin_disable_mem_helpers in cpu_tb_exec,
we don't need to do this in generated code as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-3-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/tcg-op.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index ddab20a6a6..3136cef81a 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2808,7 +2808,6 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
     }
 
-    plugin_gen_disable_mem_helpers();
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
 
-- 
2.39.2


